package com.team2final.minglecrm.controller.employee.response;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public class AuthEmailSendResponse {

    private final String status;
    private final Boolean data;
}
