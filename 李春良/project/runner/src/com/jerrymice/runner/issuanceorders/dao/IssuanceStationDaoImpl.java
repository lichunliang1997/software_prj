package com.jerrymice.runner.issuanceorders.dao;

import org.springframework.stereotype.Repository;

import com.jerrymice.runner.entity.Station;
import com.jerrymice.runner.util.impl.BaseDaoImpl;
@Repository(value="issuanceStationDaoId")
public class IssuanceStationDaoImpl extends BaseDaoImpl<Station>  implements IssuanceStationDao{

}
