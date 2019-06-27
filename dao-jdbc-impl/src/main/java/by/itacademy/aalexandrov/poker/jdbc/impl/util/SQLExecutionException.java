package by.itacademy.aalexandrov.poker.jdbc.impl.util;

@SuppressWarnings("serial")
public class SQLExecutionException extends RuntimeException {

	public SQLExecutionException(final Exception cause) {
		super(cause);
	}

}