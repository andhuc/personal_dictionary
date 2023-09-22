package model;

/**
 *
 * @author anhdu
 */
public class Word {
    
    private int id;
    private String word;
    private String meaning;
    private int setID;

    public Word() {
    }

    public Word(int id, String word, String meaning, int setID) {
        this.id = id;
        this.word = word;
        this.meaning = meaning;
        this.setID = setID;
    }

    public String getWord() {
        return word;
    }

    public void setWord(String word) {
        this.word = word;
    }

    public String getMeaning() {
        return meaning;
    }

    public void setMeaning(String meaning) {
        this.meaning = meaning;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSetID() {
        return setID;
    }

    public void setSetID(int setID) {
        this.setID = setID;
    }
    
    
    
}
