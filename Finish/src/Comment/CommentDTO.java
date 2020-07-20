package Comment;

import java.sql.Timestamp;

public class CommentDTO {
private String id,content;
private int num;
private Timestamp date;
private int idx;



public int getIdx() {
	return idx;
}
public void setIdx(int idx) {
	this.idx = idx;
}
public Timestamp getDate() {
	return date;
}
public void setDate(Timestamp date) {
	this.date = date;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public int getNum() {
	return num;
}
public void setNum(int num) {
	this.num = num;
}


}
