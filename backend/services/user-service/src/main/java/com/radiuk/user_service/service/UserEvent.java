package com.radiuk.user_service.service;

import com.radiuk.user_service.model.User;

public record UserEvent(
        User user
) {}