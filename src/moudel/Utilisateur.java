package moudel;

import BaseDeDonneConfig.ConnectionBD;
import BaseDeDonneConfig.DataExractor;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Utilisateur {
    private long id;
    private String nom;
    private String prenom;
    private String passWord;
    private String email;
    private String numeroTel;
    private Date dateNaissance;
    private String type;


    public Utilisateur(long id, String nom, String prenom, String passWord, String email, String numeroTel, Date dateNaissance, String type) {
        this.id = id;
        this.nom = nom;
        this.prenom = prenom;
        this.passWord = passWord;
        this.email = email;
        this.numeroTel = numeroTel;
        this.dateNaissance = dateNaissance;
        this.type = type;
    }

    public Utilisateur(long id, String nom, String prenom) {
        this.id = id;
        this.nom = nom;
        this.prenom = prenom;
    }

    public Utilisateur() {

    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNumeroTel() {
        return numeroTel;
    }

    public void setNumeroTel(String numeroTel) {
        this.numeroTel = numeroTel;
    }

    public Date getDateNaissance() {
        return dateNaissance;
    }

    public void setDateNaissance(Date dateNaissance) {
        this.dateNaissance = dateNaissance;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public List<Utilisateur> login(String email, String password) {
        String SQL = String.format("select * from utilisateur where email='%s' and password='%s'", email, password);
        return (new ConnectionBD()).getJdbcTemplate().query(SQL,
                rs -> {
                    List<Utilisateur> list = new ArrayList<Utilisateur>();
                    while (rs.next()) {
                        Utilisateur utilisateur = DataExractor.utilisateurExrator(rs);
                        list.add(utilisateur);
                    }
                    return list;
                });
    }

}
