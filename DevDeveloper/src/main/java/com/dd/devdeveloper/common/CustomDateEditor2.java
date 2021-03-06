package com.dd.devdeveloper.common;

import java.beans.PropertyEditorSupport;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.Date;

import org.springframework.util.StringUtils;


public class CustomDateEditor2 extends PropertyEditorSupport {

	private final DateFormat dateFormat;

	private final boolean allowEmpty;  //공백을 허용할 건지?

	private final int exactDateLength;


	public CustomDateEditor2(DateFormat dateFormat, boolean allowEmpty) {
		this.dateFormat = dateFormat;
		this.allowEmpty = allowEmpty;
		this.exactDateLength = -1;
	}

	public CustomDateEditor2(DateFormat dateFormat, boolean allowEmpty, int exactDateLength) {
		this.dateFormat = dateFormat;
		this.allowEmpty = allowEmpty;
		this.exactDateLength = exactDateLength;
	}


	/**
	 * Parse the Date from the given text, using the specified DateFormat.
	 */
	@Override 
	public void setAsText(String text) throws IllegalArgumentException {
		if (this.allowEmpty && !StringUtils.hasText(text)) {
			// Treat empty String as null value.
			setValue(null);
		}
		else if (text != null && this.exactDateLength >= 0 && text.length() != this.exactDateLength) {
			throw new IllegalArgumentException(
					"Could not parse date: it is not exactly" + this.exactDateLength + "characters long");
		}
		else {
			try {
				//text = text.replace("-", "/");
				setValue(new java.sql.Date(this.dateFormat.parse(text).getTime()) );  //util.Date를 sql.Date로 변환
				
				System.out.println("sql date로 변환 _________________" + new java.sql.Date(this.dateFormat.parse(text).getTime()));
			}
			
			catch (ParseException ex) {
				throw new IllegalArgumentException("Could not parse date: " + ex.getMessage(), ex);
			}
		}
	}

	/**
	 * Format the Date as String, using the specified DateFormat.
	 */
	@Override
	public String getAsText() {
		java.sql.Date date = new java.sql.Date( ((Date)getValue()).getTime() );
		return (date != null ? this.dateFormat.format(date) : "");
	}

}
