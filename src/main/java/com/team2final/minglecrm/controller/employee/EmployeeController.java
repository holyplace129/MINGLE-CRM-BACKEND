package com.team2final.minglecrm.controller.employee;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.team2final.minglecrm.controller.employee.request.*;
import com.team2final.minglecrm.controller.employee.response.*;
import com.team2final.minglecrm.service.email.EmailAuthService;
import com.team2final.minglecrm.service.jwt.JwtProvider;
import com.team2final.minglecrm.service.employee.EmployeeService;
import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class EmployeeController {

    private final EmployeeService employeeService;
    private final JwtProvider jwtProvider;
    private final EmailAuthService emailAuthService;

    @PostMapping("/api/v1/auth/signup")
    public ResponseEntity<SignUpResponse> signUp(@RequestBody SignUpRequest requestDTO) {
        SignUpResponse responseDTO = employeeService.signUp(requestDTO);
        return new ResponseEntity<>(responseDTO, HttpStatus.CREATED);
    }

    @PostMapping("/api/v1/auth/signin/valid")
    public ResponseEntity<SignInValidResponse> signInValid(@RequestBody SignInRequest request) {
        if(employeeService.isValidEmailAndPassword(request)) {
            return ResponseEntity.status(HttpStatus.OK).body(new SignInValidResponse("success", true));
        } else {
            return ResponseEntity.status(HttpStatus.OK).body(new SignInValidResponse("failed", false));
        }
    }
    @PostMapping("/api/v1/auth/signin/email")
    public ResponseEntity<SignInEmailAuthResponse> SignInEmailAuth(@RequestBody SignInEmailAuthRequest request) throws MessagingException {
        try {
            emailAuthService.SendSignInAuthEmail(request.getEmail());
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.OK).body(new SignInEmailAuthResponse("failed", false));
        }
        return ResponseEntity.status(HttpStatus.OK).body(new SignInEmailAuthResponse("success", true));
    }

    @PostMapping("/api/v1/auth/signin")
    public ResponseEntity<TokenResponse> checkAuthCode(@RequestBody SignInCheckRequest request) throws JsonProcessingException {
        Boolean isValidAuthCode = emailAuthService.AuthEmailCheck(request.getAuthCode(), request.getEmail());
        if (!isValidAuthCode) {
            return ResponseEntity.status(HttpStatus.OK).body(TokenResponse.builder()
                    .status("failed")
                    .build());
        }
        TokenResponse tokenResponse = jwtProvider.createTokensBySignIn(request.getEmail());
        return ResponseEntity.status(HttpStatus.OK).body(tokenResponse);
    }

    @PostMapping("/api/v1/auth/signintest")
    public ResponseEntity<TokenResponse> singInTest(@RequestBody SignInRequest request) throws JsonProcessingException {
        if(employeeService.isValidEmailAndPassword(request)) {
            TokenResponse tokenResponse = jwtProvider.createTokensBySignIn(request.getEmail());
            return ResponseEntity.status(HttpStatus.OK).body(tokenResponse);
        } else {
            return ResponseEntity.status(HttpStatus.OK).body(TokenResponse.builder()
                    .status("failed")
                    .build());
        }
    }


    @GetMapping("/api/v1/auth/renew")
    public ResponseEntity<TokenResponse> reNew(HttpServletRequest request) throws JsonProcessingException {
        String rtk = request.getHeader("Authorization").substring(7);
        TokenResponse responseDTO = jwtProvider.renewToken(rtk);
        return new ResponseEntity<>(responseDTO, HttpStatus.OK);
    }

    @GetMapping("/api/v1/auth/logout")
    public ResponseEntity<Void> logout(HttpServletRequest request) throws JsonProcessingException {
        String atk = request.getHeader("Authorization").substring(7);
        employeeService.logout(atk);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @PostMapping("/api/v1/auth/signup/emailauth")
    public ResponseEntity<AuthEmailSendResponse> AuthEmailSend(@RequestBody SignUpEmailRequest signUpEmailRequest) throws MessagingException {

        try {
            emailAuthService.SendSignUpAuthEmail(signUpEmailRequest.getEmail());
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.OK).body(new AuthEmailSendResponse("failed", false));
        }
        return ResponseEntity.status(HttpStatus.OK).body(new AuthEmailSendResponse("secuccess", true));
    }

    @PostMapping("/api/v1/auth/authcheck")
    public ResponseEntity<AuthEmailCheckResponse> AuthEmailCheck(@RequestBody SignUpEmailAuthRequest request) {
        Boolean isCorrect = emailAuthService.AuthEmailCheck(request.getAuthCode(), request.getEmail());
        if (isCorrect) {
            return ResponseEntity.status(HttpStatus.ACCEPTED).body(new AuthEmailCheckResponse("success", true));
        }
        return ResponseEntity.status(HttpStatus.OK).body(new AuthEmailCheckResponse("failed", false));
    }

}
