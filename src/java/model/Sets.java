package model;

/**
 *
 * @author anhdu
 */
public class Sets {
    private int id;
    private String name;
    private String owner;

    public Sets() {
    }

    public Sets(int id, String name, String owner) {
        this.name = name;
        this.owner = owner;
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    
}
