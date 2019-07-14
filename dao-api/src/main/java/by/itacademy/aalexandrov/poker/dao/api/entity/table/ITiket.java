package by.itacademy.aalexandrov.poker.dao.api.entity.table;

public interface ITiket extends IBaseEntity {

	void setStatus(String status);

	String getStatus();

	void setTiketText(String tiketText);

	String getTiketText();

	void setTiketTitle(String tiketTitle);

	String getTiketTitle();

	void setUserAccount(IUserAccount userAccount);

	IUserAccount getUserAccount();

	
}
