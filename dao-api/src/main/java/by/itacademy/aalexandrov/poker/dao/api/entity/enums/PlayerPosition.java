package by.itacademy.aalexandrov.poker.dao.api.entity.enums;

public enum PlayerPosition {
	ONE(1), TWO(2), THREE(3), FOUR(4), FIVE(5), SIX(6), SEVEN(7), EIGHT(8), NINE(9), TEN(10);

	private final int position;

	private PlayerPosition(int position) {
		this.position = position;
	}

	public int getPosition() {
		return position;
	}

}
