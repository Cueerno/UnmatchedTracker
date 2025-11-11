package com.radiuk.backup_service.config;


import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.Queue;
import org.springframework.amqp.core.TopicExchange;
import org.springframework.amqp.rabbit.connection.ConnectionFactory;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.amqp.support.converter.Jackson2JsonMessageConverter;
import org.springframework.amqp.support.converter.MessageConverter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class RabbitConfig {

    public static final String EXCHANGE_NAME = "backup.exchange";

    public static final String USER_QUEUE = "backup.user.queue";
    public static final String USER_ROUTING_KEY = "backup.user.created";

    public static final String PARTY_QUEUE = "backup.party.queue";
    public static final String PARTY_ROUTING_KEY = "backup.party.created";

    @Bean
    public TopicExchange backupExchange() {
        return new TopicExchange(EXCHANGE_NAME, true, false);
    }


    @Bean
    public Queue userCreatedQueue() {
        return new Queue(USER_QUEUE, true);
    }

    @Bean
    public Binding userBinding(Queue userCreatedQueue, TopicExchange backupExchange) {
        return BindingBuilder.bind(userCreatedQueue).to(backupExchange).with(USER_ROUTING_KEY);
    }


    public Queue partyCreatedQueue() {
        return new Queue(PARTY_QUEUE, true);
    }

    @Bean
    public Binding partyBinding(Queue partyCreatedQueue, TopicExchange backupExchange) {
        return BindingBuilder.bind(partyCreatedQueue).to(backupExchange).with(PARTY_ROUTING_KEY);
    }


    @Bean
    public MessageConverter jsonMessageConverter() {
        return new Jackson2JsonMessageConverter();
    }

    @Bean
    public RabbitTemplate rabbitTemplate(ConnectionFactory connectionFactory, MessageConverter messageConverter) {
        RabbitTemplate rabbitTemplate = new RabbitTemplate(connectionFactory);
        rabbitTemplate.setMessageConverter(messageConverter);
        return rabbitTemplate;
    }
}
