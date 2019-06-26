package by.itacademy.aalexandrov.poker.dao.api.entity.table;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.UserRole;
import by.itacademy.aalexandrov.poker.dao.api.entity.enums.UserStatus;

public interface IUserAccount extends IBaseEntity {

	void setTranzaction(ITransaction tranzaction);

	ITransaction getTranzaction();

	void setUserStatus(UserStatus userStatus);

	UserStatus getUserStatus();

	void setUserRole(UserRole userRole);

	UserRole getUserRole();

	void setFoto(String foto);

	String getFoto();

	void setEmail(String email);

	String getEmail();

	void setPassword(String password);

	String getPassword();

	void setNickname(String nickname);

	String getNickname();

	void setStatisticId(IStatistic statisticId);

	IStatistic getStatisticId();

	void setCountryId(ICountry countryId);

	ICountry getCountryId();

}
