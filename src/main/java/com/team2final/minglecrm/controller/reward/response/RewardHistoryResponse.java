package com.team2final.minglecrm.controller.reward.response;

import com.team2final.minglecrm.entity.reward.RewardHistory;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

import java.time.LocalDateTime;

@Getter
@RequiredArgsConstructor
public class RewardHistoryResponse {
    private final Long customerId;
    private final Long paymentId;
    private final Long voucherId;
    private final Long amount;
    private final String reason;
    private final LocalDateTime date;
    private final String type;

    public static RewardHistoryResponse of(RewardHistory rewardHistory){
        Long voucherId = rewardHistory.getVoucher() != null ? rewardHistory.getVoucher().getId() : null;
        Long paymentId = rewardHistory.getPayment() != null ? rewardHistory.getPayment().getId() : null;

        return new RewardHistoryResponse(
                rewardHistory.getReward().getCustomer().getId(),
//                rewardHistory.getPayment().getId(),
                paymentId,
//                rewardHistory.getVoucher().getId(),
                voucherId,
                rewardHistory.getAmount(),
                rewardHistory.getReason(),
                rewardHistory.getDate(),
                rewardHistory.getType()
        );
    }

}
