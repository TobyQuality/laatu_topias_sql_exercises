# MariaDB:n asentaminen

Tällä kurssilla käytämme MariaDB:tä tietokannanhallintajärjestelmänä (DBMS). Nämä ohjeet on tarkoitettu DBMS:n asentamiseen
Windows-tietokoneelle.

Jos sinulla on käytössäsi Mac, seuraa MariaDB:n ohjeita tietokannanhallintajärjestelmän asentamiseksi.
[Linkki](https://mariadb.com/kb/en/installing-mariadb-on-macos-using-homebrew/)
HUOM! Tämä vaatii Homebrew:n asentamisen. Jos sinulla ei ole vielä Homebrew:ta, asenna se [täältä](https://brew.sh/).
Tämän jälkeen siirry kohtaan 2.

1. Lataa ja asenna MariaDB
 * Lataa MariaDB [projektin verkkosivulta](https://mariadb.org/download/).
   * Kurssilla käytetty versio on 11.0
 * Kaksoisklikkaa ladattua tiedostoa ja seuraa asentimen ohjeita
   * Asenna MariaDB esimerkiksi Program Files -hakemistoon (oletus)
 * Asennin luo root-käyttäjän asennuksen yhteydessä.
   * Määritä root-käyttäjän salasana.
   * Valitse salasana, jonka muistat!
   * TÄRKEÄ! Varmista, että "Enable access from remote machine for 'root' user" EI ole valittuna!
 * Valitse "Use UTF-8 as default server's character set"
 * Jos haluat MariaDB:n käynnistyvän automaattisesti Windowsin yhteydessä, valitse "Install as service"
   * Jos tämä ei ole valittu, joudut käynnistämään MariaDB:n manuaalisesti aina sitä käytettäessä
 * Valitse "Enable networking"

2. MariaDB:n käyttö
 * Kun MariaDB on asennettu, voit käyttää sitä komentoriviltä "mysql"-nimisen sovelluksen kautta
 * Testataan MariaDB:n toimintaa
   * Avaa komentokehote
   * Syötä komento "mysql --version"
     * Jos komentorivi palauttaa MariaDB:n version oikein, on MariaDB asennettu oikein
   * Siirry kurssin repositorioon kansioon Materials
   * Suorita komento mysql -u root -p < create_music.sql
     * HUOM! Tämä komento ei toimi PowerShell:llä. Käytä Command Prompt:a
     * 1. harjoituksessa tarvittava music-tietokanta on nyt luotu

