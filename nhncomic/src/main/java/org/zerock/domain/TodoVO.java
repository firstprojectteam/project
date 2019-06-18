package org.zerock.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@EqualsAndHashCode(of = "tno")
@ToString
public class TodoVO {

	private static int COUNT;
	
	private Integer tno;
	private String title;
	private String content;
	
	public TodoVO() {
		tno = ++COUNT;
	}

	public TodoVO( String title, String content) {
		
		this.tno = ++COUNT;
		this.title = title;
		this.content = content;
	}
	
}
