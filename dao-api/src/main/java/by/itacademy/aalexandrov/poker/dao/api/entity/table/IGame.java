package by.itacademy.aalexandrov.poker.dao.api.entity.table;

import by.itacademy.aalexandrov.poker.dao.api.entity.enums.GameStatus;

public interface IGame extends IBaseEntity {

	String toString();

	void setBank(double bank);

	double getBank();

	void setState(GameStatus state);

	GameStatus getState();

	void setPosition10(boolean position10);

	boolean isPosition10();

	void setPosition9(boolean position9);

	boolean isPosition9();

	void setPosition8(boolean position8);

	boolean isPosition8();

	void setPosition7(boolean position7);

	boolean isPosition7();

	void setPosition6(boolean position6);

	boolean isPosition6();

	void setPosition5(boolean position5);

	boolean isPosition5();

	void setPosition4(boolean position4);

	boolean isPosition4();

	void setPosition3(boolean position3);

	boolean isPosition3();

	void setPosition2(boolean position2);

	boolean isPosition2();

	void setPosition1(boolean position1);

	boolean isPosition1();

}
