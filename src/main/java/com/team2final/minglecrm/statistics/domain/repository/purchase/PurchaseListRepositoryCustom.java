package com.team2final.minglecrm.statistics.domain.repository.purchase;

import com.team2final.minglecrm.statistics.dto.response.purchase.*;

import java.time.LocalDate;
import java.util.List;

public interface PurchaseListRepositoryCustom {
    List<StatisticsDishNameResponse> findStatisticsByDishName(LocalDate startDate, LocalDate endDate);
    List<StatisticsRoomTypeResponse> findStatisticsByRoomType(LocalDate startDate, LocalDate endDate);
    List<StatisticsDishNameAndRoomTypeResponse> findStatisticsByDishNameAndRoomType(LocalDate startDate, LocalDate endDate);
    List<StatisticsGenderResponse> findStatisticsByGender(LocalDate startDate, LocalDate endDate, String gender);
    List<StatisticsGradeResponse> findStatisticsByGrade(LocalDate startDate, LocalDate endDate, String grade);
}
