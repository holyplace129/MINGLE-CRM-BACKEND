package com.team2final.minglecrm.controller.dining.reservation.response;

import com.team2final.minglecrm.entity.dining.Dish;
import com.team2final.minglecrm.entity.dining.DishReservation;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public class DiningReservationResponse {

    // 상태, 총 가격, 예약 날짜
    private final Long totalPrice;
    private final LocalDateTime reservationDate;

    // 식사 상품 이름, 식사 가격, 식사 상품 개수
    private final List<DishResponse> dishes;

    public static DiningReservationResponse of(DishReservation dishReservation, List<Dish> dishes) {
        List<DishResponse> dishResponses = dishes.stream()
                .map(DishResponse::of)
                .collect(Collectors.toList());

        return new DiningReservationResponse(
                dishReservation.getTotalPrice(),
                dishReservation.getReservationDate(),
                dishResponses
        );
    }



}
