package com.softwerke.docs.booklist.businesslogic;

import java.util.*;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.softwerke.docs.booklist.model.Author;
import com.softwerke.docs.booklist.model.Book;
import com.softwerke.docs.booklist.service.BookLocalServiceUtil;

/**
 * Model class for {@link com.softwerke.docs.booklist.model.Author Author}
 * @author Romanov Egor
 */
public class AuthorItem {
	private long Id;
	private String firstName;
	private String lastName;
	private Date birthDate;
	private String email;
	private ArrayList<Book> relatedBooks;

	public AuthorItem(Author author) throws SystemException, PortalException {
		this.Id = author.getAuthorId();
		this.firstName = author.getFirstName();
		this.lastName = author.getLastName();
		this.birthDate = author.getBirthDate();
		this.email = author.getEmail();
		this.relatedBooks = new ArrayList<Book>(
				BookLocalServiceUtil.getBooksByAuthor(this.Id));
	}

	public long getId() {
		return Id;
	}

	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public String getBirthDate() {
		String date = birthDate.toString();
		String[] tmp = date.split(" ");
		return String.format("%s %s %s", tmp[2], tmp[1], tmp[5]); 
	}

	public String getEmail() {
		return email;
	}

	public ArrayList<Book> getRelatedBooks() {
		return relatedBooks;
	}
}
