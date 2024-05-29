package com.team2final.minglecrm.controller.hotel.reservation.response;

import com.team2final.minglecrm.entity.hotel.RoomReservation;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public class RoomReservationResponse {

    // 상태, 예약일, 고객명, 연락처
//    private final String state;
    private final LocalDateTime reservationDate;
    private final String name;
    private final String phoneNumber;

    // 상품명(호텔이름), 예약타입, 예약내용
    private final String hotelName;
    private final String reservationType;
//    private final String reservationMemo;


    // 담당자, 메모
//    private final String employeeName;
    private final String memo;

    public static RoomReservationResponse of(RoomReservation roomReservation) {
        return new RoomReservationResponse(
                roomReservation.getReservationDate(),
                roomReservation.getCustomer().getName(),
                roomReservation.getCustomer().getPhone(),
                roomReservation.getHotelRoom().getHotel(),
                roomReservation.getHotelRoom().getRoomType().name(),
                roomReservation.getCustomer().getMemo()
                );
    }

    //    @Builder
//    public RoomReservationResponse(String state, LocalDateTime reservationDate, String name,
//            String phoneNumber, String hotelName, String reservationType, String reservationMemo,
//            String employeeName, String memo) {
//        this.state = state;
//        this.reservationDate = reservationDate;
//        this.name = name;
//        this.phoneNumber = phoneNumber;
//        this.hotelName = hotelName;
//        this.reservationType = reservationType;
//        this.reservationMemo = reservationMemo;
//        this.employeeName = employeeName;
//        this.memo = memo;
//    }


}
