package com.radiuk.unmatched_backend_core.config;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.json.JsonMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.radiuk.unmatched_backend_core.dto.DeckDto;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.cache.RedisCacheConfiguration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.serializer.*;

import java.time.Duration;
import java.util.Map;
import java.util.function.Function;

@Configuration
@EnableCaching
public class RedisCacheConfig {

    @Bean
    public ObjectMapper objectMapper() {
        return JsonMapper.builder()
                .addModule(new JavaTimeModule())
                .disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS)
                .disable(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES)
                .build();
    }

    @Bean
    public CacheManager cacheManager(RedisConnectionFactory factory, ObjectMapper objectMapper) {
        RedisCacheConfiguration baseConfig = RedisCacheConfiguration.defaultCacheConfig()
                .disableCachingNullValues()
                .serializeKeysWith(
                        RedisSerializationContext
                                .SerializationPair
                                .fromSerializer(new StringRedisSerializer())
                );

        Function<CacheConfigEntry, RedisCacheConfiguration> createConfig =
                entry -> baseConfig
                        .entryTtl(entry.ttl)
                        .serializeValuesWith(
                                RedisSerializationContext
                                        .SerializationPair
                                        .fromSerializer(entry.valueSerializer)
                        );

        Jackson2JsonRedisSerializer<DeckDto> deckSerializer = new Jackson2JsonRedisSerializer<>(DeckDto.class);
        deckSerializer.setObjectMapper(objectMapper);

        GenericJackson2JsonRedisSerializer listSerializer = new GenericJackson2JsonRedisSerializer(objectMapper);


        Map<String, RedisCacheConfiguration> configs = Map.of(
                "deckList", createConfig.apply(new CacheConfigEntry(Duration.ofMinutes(10), listSerializer)),
                "deck", createConfig.apply(new CacheConfigEntry(Duration.ofHours(1), deckSerializer)),
                "deckTop", createConfig.apply(new CacheConfigEntry(Duration.ofMinutes(10), listSerializer))
        );

        return RedisCacheManager.builder(factory)
                .cacheDefaults(baseConfig)
                .withInitialCacheConfigurations(configs)
                .transactionAware()
                .build();
    }

    private record CacheConfigEntry(
            Duration ttl,
            RedisSerializer<?> valueSerializer
    ) {}
}
