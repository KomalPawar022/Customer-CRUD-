package com.bean;
// To store and access Customer Data
import java.security.SecureRandom;
import java.util.Random;

public class CustomerBean {
public String uuid;
public String FirstName;
public String LastName;
public String Street;

public String Address;
public String City;
public String State;
public String Email;
public String Phone;

private static final String ALPHA_NUMERIC_STRING = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
private static final Random SECURE_RANDOM = new SecureRandom();



public String getuuid() {
	return uuid;
}

public void setuuid() {
	this.uuid = generateRandomId(21);
	
}

public void setuuid(String id) {
	this.uuid = id;
	
}


public String getFirstName() {
	return FirstName;
}

public void setFirstName(String FirstName) {
	this.FirstName = FirstName;
}

public String getLastName() {
	return LastName;
}

public void setLastName(String LastName) {
	this.LastName = LastName;
}

public String getStreet() {
	return Street;
}

public void setStreet(String Street) {
	this.Street = Street;
}

public String getAddress() {
	return Address;
}

public void setAddress(String Address) {
	this.Address = Address;
}
public String getCity() {
	return City;
}

public void setCity(String City) {
	this.City = City;
}
public String getState() {
	return State;
}

public void setState(String State) {
	this.State = State;
}
public String getEmail() {
	return Email;
}

public void setEmail(String Email) {
	this.Email = Email;
}
public String getPhone() {
	return Phone;
}

public void setPhone(String Phone) {
	this.Phone = Phone;
}


public static String generateRandomId(int length) {
    StringBuilder builder = new StringBuilder(length);
    for (int i = 0; i < length; i++) {
        int characterIndex = SECURE_RANDOM.nextInt(ALPHA_NUMERIC_STRING.length());
        builder.append(ALPHA_NUMERIC_STRING.charAt(characterIndex));
    }
    return builder.toString();
}


}
