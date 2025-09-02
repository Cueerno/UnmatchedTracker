package com.radiuk.unmatched_backend_core.config;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.json.JsonMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.radiuk.unmatched_backend_core.dto.*;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.cache.RedisCacheConfiguration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.serializer.*;

import java.time.Duration;
import java.util.HashMap;
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

        Jackson2JsonRedisSerializer<PartyDto> partySerializer = new Jackson2JsonRedisSerializer<>(PartyDto.class);
        partySerializer.setObjectMapper(objectMapper);

        Jackson2JsonRedisSerializer<SetDto> setSerializer = new Jackson2JsonRedisSerializer<>(SetDto.class);
        setSerializer.setObjectMapper(objectMapper);

        Jackson2JsonRedisSerializer<DeckDto> deckSerializer = new Jackson2JsonRedisSerializer<>(DeckDto.class);
        deckSerializer.setObjectMapper(objectMapper);

        Jackson2JsonRedisSerializer<CardDto> cardSerializer = new Jackson2JsonRedisSerializer<>(CardDto.class);
        cardSerializer.setObjectMapper(objectMapper);

        Jackson2JsonRedisSerializer<BoardDto> boardSerializer = new Jackson2JsonRedisSerializer<>(BoardDto.class);
        boardSerializer.setObjectMapper(objectMapper);

        Jackson2JsonRedisSerializer<HomeDashboardDto> dashboardSerializer = new Jackson2JsonRedisSerializer<>(HomeDashboardDto.class);
        dashboardSerializer.setObjectMapper(objectMapper);

        GenericJackson2JsonRedisSerializer listSerializer = new GenericJackson2JsonRedisSerializer(objectMapper);

        Map<String, RedisCacheConfiguration> configs = new HashMap<>();

        configs.put("userPartyList", createConfig.apply(new CacheConfigEntry(Duration.ofMinutes(20), listSerializer)));
        configs.put("party",         createConfig.apply(new CacheConfigEntry(Duration.ofMinutes(20), partySerializer)));

        configs.put("setList",       createConfig.apply(new CacheConfigEntry(Duration.ofMinutes(10), listSerializer)));
        configs.put("set",           createConfig.apply(new CacheConfigEntry(Duration.ofMinutes(10), setSerializer)));

        configs.put("deckList",      createConfig.apply(new CacheConfigEntry(Duration.ofMinutes(10), listSerializer)));
        configs.put("deck",          createConfig.apply(new CacheConfigEntry(Duration.ofMinutes(10), deckSerializer)));
        configs.put("deckTop",       createConfig.apply(new CacheConfigEntry(Duration.ofMinutes(10), listSerializer)));

        configs.put("cardList",      createConfig.apply(new CacheConfigEntry(Duration.ofMinutes(10), listSerializer)));
        configs.put("card",          createConfig.apply(new CacheConfigEntry(Duration.ofMinutes(10), cardSerializer)));

        configs.put("boardList",     createConfig.apply(new CacheConfigEntry(Duration.ofMinutes(10), listSerializer)));
        configs.put("board",         createConfig.apply(new CacheConfigEntry(Duration.ofMinutes(10), boardSerializer)));

        configs.put("dashboard",     createConfig.apply(new CacheConfigEntry(Duration.ofMinutes(10), dashboardSerializer)));


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
