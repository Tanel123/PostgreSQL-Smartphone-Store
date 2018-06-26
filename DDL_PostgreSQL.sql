DROP SEQUENCE IF EXISTS isik_isik_id_seq
;

DROP TABLE IF EXISTS Kauba_kategooria_tyyp CASCADE
;

DROP TABLE IF EXISTS Kaup_kategooria CASCADE
;

DROP TABLE IF EXISTS Isiku_seisundi_liik CASCADE
;

DROP TABLE IF EXISTS Kauba_seisundi_liik CASCADE
;

DROP TABLE IF EXISTS Kliendi_seisundi_liik CASCADE
;

DROP TABLE IF EXISTS Tootaja_seisundi_liik CASCADE
;

DROP TABLE IF EXISTS Brand CASCADE
;

DROP TABLE IF EXISTS Diagonaal CASCADE
;

DROP TABLE IF EXISTS Ekraan_resolutsioon CASCADE
;

DROP TABLE IF EXISTS Kaamera CASCADE
;

DROP TABLE IF EXISTS Protsessor CASCADE
;

DROP TABLE IF EXISTS Sisemalu CASCADE
;

DROP TABLE IF EXISTS Varv CASCADE
;

DROP TABLE IF EXISTS Amet CASCADE
;

DROP TABLE IF EXISTS Riik CASCADE
;

DROP TABLE IF EXISTS Isik CASCADE
;

DROP TABLE IF EXISTS Klient CASCADE
;

DROP TABLE IF EXISTS Tootaja CASCADE
;

DROP TABLE IF EXISTS Kaup CASCADE
;

DROP TABLE IF EXISTS Kaubale_kategooria_omamine CASCADE
;

DROP TABLE IF EXISTS Kaup_variant CASCADE
;

DROP TABLE IF EXISTS Nutitelefon CASCADE
;

CREATE TABLE Kauba_kategooria_tyyp
(
	kauba_kategooria_tyyp_kood smallint NOT NULL,
	nimetus d_nimetus,
	CONSTRAINT PK_Kauba_kategooria_tyyp PRIMARY KEY (kauba_kategooria_tyyp_kood),
	CONSTRAINT AK_Kauba_kategooria_tyyp_nimetus UNIQUE (nimetus)
)
;

CREATE TABLE Kaup_kategooria
(
	kauba_kategooria_kood smallint NOT NULL,
	nimetus d_nimetus,
	kauba_kategooria_tyyp_kood smallint NOT NULL,
	CONSTRAINT PK_Kaup_kategooria PRIMARY KEY (kauba_kategooria_kood),
	CONSTRAINT AK_Kaup_kategooria_nimetus UNIQUE (nimetus),
	CONSTRAINT FK_Kaup_kategooria_on_seotud_Kauba_kategooria_tyyp FOREIGN KEY (kauba_kategooria_tyyp_kood) REFERENCES Kauba_kategooria_tyyp (kauba_kategooria_tyyp_kood) ON DELETE No Action ON UPDATE Cascade
)
;

CREATE TABLE Isiku_seisundi_liik
(
	isiku_seisundi_liik_kood smallint NOT NULL,
	nimetus d_nimetus,
	CONSTRAINT PK_Isiku_seisundi_liik PRIMARY KEY (isiku_seisundi_liik_kood),
	CONSTRAINT AK_Isiku_seisundi_liik_nimetus UNIQUE (nimetus)
)
;

CREATE TABLE Kauba_seisundi_liik
(
	kauba_seisundi_liik_kood smallint NOT NULL,
	nimetus d_nimetus,
	CONSTRAINT PK_Kauba_seisundi_liik PRIMARY KEY (kauba_seisundi_liik_kood),
	CONSTRAINT AK_Kauba_seisundi_liik_nimetus UNIQUE (nimetus)
)
;

CREATE TABLE Kliendi_seisundi_liik
(
	kliendi_seisundi_liik_kood smallint NOT NULL,
	nimetus d_nimetus,
	CONSTRAINT PK_Kliendi_seisundi_liik PRIMARY KEY (kliendi_seisundi_liik_kood),
	CONSTRAINT AK_Kliendi_seisundi_liik_nimetus UNIQUE (nimetus)
)
;

CREATE TABLE Tootaja_seisundi_liik
(
	tootaja_seisundi_liik_kood smallint NOT NULL,
	nimetus d_nimetus,
	CONSTRAINT PK_Tootaja_seisundi_liik PRIMARY KEY (tootaja_seisundi_liik_kood),
	CONSTRAINT AK_Tootaja_seisundi_liik_nimetus UNIQUE (nimetus)
)
;

CREATE TABLE Brand
(
	brand_kood smallint NOT NULL,
	nimetus d_nimetus,
	CONSTRAINT PK_Brand PRIMARY KEY (brand_kood),
	CONSTRAINT AK_Brand_nimetus UNIQUE (nimetus)
)
;

CREATE TABLE Diagonaal
(
	diagonaal_kood decimal(2,1) NOT NULL,
	nimetus d_nimetus,
	CONSTRAINT PK_Diagonaal PRIMARY KEY (diagonaal_kood),
	CONSTRAINT AK_Diagonaal_nimetus UNIQUE (nimetus),
	CONSTRAINT chk_Diagonaal_diagonaal_kood_peab_olema_suurem_nullist CHECK (diagonaal_kood>0)
)
;

CREATE TABLE Ekraan_resolutsioon
(
	ekraan_resolutsioon_kood smallint NOT NULL,
	nimetus d_nimetus,
	CONSTRAINT PK_Ekraan_resolutsioon PRIMARY KEY (ekraan_resolutsioon_kood),
	CONSTRAINT AK_Ekraan_resolutsioon_nimetus UNIQUE (nimetus)
)
;

CREATE TABLE Kaamera
(
	kaamera_kood smallint NOT NULL,
	nimetus d_nimetus,
	CONSTRAINT PK_Kaamera PRIMARY KEY (kaamera_kood),
	CONSTRAINT AK_Kaamera_nimetus UNIQUE (nimetus),
	CONSTRAINT chk_Kaamera_kaamera_kood_peab_olema_suurem_nullist CHECK (kaamera_kood>0)
)
;

CREATE TABLE Protsessor
(
	protsessor_kood smallint NOT NULL,
	nimetus d_nimetus,
	CONSTRAINT PK_Protsessor PRIMARY KEY (protsessor_kood),
	CONSTRAINT AK_Protsessor_nimetus UNIQUE (nimetus)
)
;

CREATE TABLE Sisemalu
(
	sisemalu_kood smallint NOT NULL,
	nimetus d_nimetus,
	CONSTRAINT PK_Sisemalu PRIMARY KEY (sisemalu_kood),
	CONSTRAINT AK_Sisemalu_nimetus UNIQUE (nimetus),
	CONSTRAINT chk_Sisemalu_sisemalu_kood_peab_olema_suurem_nullist CHECK (sisemalu_kood>0)
)
;

CREATE TABLE Varv
(
	varv_kood smallint NOT NULL,
	nimetus d_nimetus,
	CONSTRAINT PK_Varv PRIMARY KEY (varv_kood),
	CONSTRAINT AK_Varv_nimetus UNIQUE (nimetus)
)
;

CREATE TABLE Amet
(
	amet_kood smallint NOT NULL,
	nimetus d_nimetus,
	kirjeldus d_kirjeldus,
	CONSTRAINT PK_Amet PRIMARY KEY (amet_kood),
	CONSTRAINT AK_Amet_nimetus UNIQUE (nimetus)
)
;

CREATE TABLE Riik
(
	riik_kood char(3)	 NOT NULL,
	nimetus d_nimetus,
	CONSTRAINT PK_Riik PRIMARY KEY (riik_kood),
	CONSTRAINT AK_Riik_nimetus UNIQUE (nimetus),
	CONSTRAINT chk_Riik_riik_kood_peab_olema_kolm_tahemarki_pikk CHECK (riik_kood~'^[A-Z]{3}$')
)
;

CREATE TABLE Isik
(
	isik_id serial NOT NULL,
	isikukood varchar(50)	 NOT NULL,
	isikukood_riik char(3)	 NOT NULL,
	e_meil varchar(254)	 NOT NULL,
	synni_kp date NOT NULL,
	parool varchar(60)	 NOT NULL,
	reg_aeg d_reg_aeg,
	isiku_seisundi_liik_kood smallint NOT NULL DEFAULT 1,
	eesnimi varchar(1000)	,
	perenimi varchar(1000)	,
	elukoht varchar(1000)	,
	CONSTRAINT PK_Isik PRIMARY KEY (isik_id),
    CONSTRAINT FK_Isik_on_seotud_Isiku_seisundi_liik FOREIGN KEY (isiku_seisundi_liik_kood) REFERENCES Isiku_seisundi_liik (isiku_seisundi_liik_kood) ON DELETE No Action ON UPDATE Cascade,
    CONSTRAINT FK_Isik_on_seotud_Riik FOREIGN KEY (isikukood_riik) REFERENCES Riik (riik_kood) ON DELETE No Action ON UPDATE Cascade,
	CONSTRAINT AK_Isik_e_meil UNIQUE INDEX (Upper(e_meil)),
	CONSTRAINT AK_Isik_isikukood_Isikukood_riik UNIQUE (isikukood,isikukood_riik),
	CONSTRAINT chk_Isik_eesnimi_ei_koosne_tyhikutest CHECK (eesnimi!~'^[[:space:]]+$'),
	CONSTRAINT chk_Isik_eesnimi_pole_tyhi_string CHECK (eesnimi!=''),
    CONSTRAINT chk_Isik_isikukood_ei_koosne_tyhikutest CHECK (isikukood!~'^[[:space:]]+$'),
	CONSTRAINT chk_Isik_isikukood_pole_tyhi_string CHECK (isikukood!=''),
	CONSTRAINT chk_Isik_eesnimi_voi_perenimi_peab_olema_registreeritud CHECK ((eesnimi IS NOT NULL) OR (perenimi IS NOT NULL)),
	CONSTRAINT chk_Isik_perenimi_ei_koosne_tyhikutest CHECK (perenimi!~'^[[:space:]]+$'),
	CONSTRAINT chk_Isik_perenimi_pole_tyhi_string CHECK (perenimi!=''),
	CONSTRAINT chk_Isik_synni_kp_on_vahemikus_01_01_1900_ja_31_12_2100 CHECK (synni_kp BETWEEN '1900-01-01' AND '2100-12-31'),
	CONSTRAINT chk_Isik_synni_kp_ei_tohi_olla_suurem_kui_reg_aeg CHECK (synni_kp<=reg_aeg),
	CONSTRAINT chk_Isik_elukoht_ei_koosne_tyhikutest CHECK (elukoht!~'^[[:space:]]+$'),
	CONSTRAINT chk_Isik_elukoht_ei_koosne_numbritest CHECK (elukoht!~'^[[:digit:]]+$'),
	CONSTRAINT chk_Isik_elukoht_ei_ole_tyhi_string CHECK (elukoht!=''),
    CONSTRAINT chk_Isik_e_meil_peab_sisaldama_at_marki CHECK (e_meil LIKE '%@%')
)
;

CREATE TABLE Klient
(
	isik_id integer NOT NULL,
	kliendi_seisundi_liik_kood smallint NOT NULL DEFAULT 1,
	on_nous_tylitamisega boolean NOT NULL DEFAULT false,
	CONSTRAINT PK_Klient PRIMARY KEY (isik_id),
    CONSTRAINT FK_Klient_on_seotud_Kliendi_seisundi_liik FOREIGN KEY (kliendi_seisundi_liik_kood) REFERENCES Kliendi_seisundi_liik (kliendi_seisundi_liik_kood) ON DELETE No Action ON UPDATE Cascade,
    CONSTRAINT FK_Klient_on_seotud_Isik FOREIGN KEY (isik_id) REFERENCES Isik (isik_id) ON DELETE Cascade
)
;

CREATE TABLE Tootaja
(
	isik_id integer NOT NULL,
	amet_kood smallint NOT NULL,
	tootaja_seisundi_liik_kood smallint NOT NULL DEFAULT 1,
	CONSTRAINT PK_Tootaja PRIMARY KEY (isik_id),
    CONSTRAINT FK_Tootaja_on_seotud_Tootaja_seisundi_liik FOREIGN KEY (tootaja_seisundi_liik_kood) REFERENCES Tootaja_seisundi_liik (tootaja_seisundi_liik_kood) ON DELETE No Action ON UPDATE Cascade,
    CONSTRAINT FK_Tootaja_on_seotud_Isik FOREIGN KEY (isik_id) REFERENCES Isik (isik_id) ON DELETE Cascade,
    CONSTRAINT FK_Tootaja_on_seotud_Amet FOREIGN KEY (amet_kood) REFERENCES Amet (amet_kood) ON DELETE No Action ON UPDATE Cascade
)
;

CREATE TABLE Kaup
(
	kaup_kood integer NOT NULL,
	nimetus varchar(255)	 NOT NULL,
	reg_aeg d_reg_aeg,
	hind decimal(19,4) NOT NULL,
	kirjeldus d_kirjeldus,
	registreerija_id integer NOT NULL,
	kauba_seisundi_liik_kood smallint NOT NULL DEFAULT 1,
	brand_kood integer NOT NULL,
	pildi_aadress varchar(500)	,
	CONSTRAINT PK_Kaup PRIMARY KEY (kaup_kood),
    CONSTRAINT FK_Kaup_on_seotud_Brand FOREIGN KEY (brand_kood) REFERENCES Brand (brand_kood) ON DELETE No Action ON UPDATE Cascade,
    CONSTRAINT FK_Kaup_on_seotud_Tootaja FOREIGN KEY (registreerija_id) REFERENCES Tootaja (isik_id) ON DELETE No Action,
    CONSTRAINT FK_Kaup_on_seotud_Kauba_seisundi_liik FOREIGN KEY (kauba_seisundi_liik_kood) REFERENCES Kauba_seisundi_liik (kauba_seisundi_liik_kood) ON DELETE No Action ON UPDATE Cascade,
	CONSTRAINT AK_Kaup_nimetus UNIQUE (nimetus),
	CONSTRAINT chk_Kaup_nimetus_ei_koosne_tyhikutest CHECK (nimetus!~'^[[:space:]]+$'),
	CONSTRAINT chk_Kaup_nimetus_pole_tyhi_string CHECK (nimetus!=''),
	CONSTRAINT chk_Kaup_hind_peab_olema_suurem_nullist CHECK (hind>0),
	CONSTRAINT chk_Kaup_pildi_aadress_sisaldab_punkti_ja_faililaiendit CHECK (pildi_aadress~'([^\s]+(\.(jpg|gif))$)')
)
;

CREATE TABLE Kaubale_kategooria_omamine
(
	kaup_kood integer NOT NULL,
	kauba_kategooria_kood smallint NOT NULL,
	CONSTRAINT PK_Kaubale_kategooria_omamine PRIMARY KEY (kaup_kood,kauba_kategooria_kood),
	CONSTRAINT FK_Kaubale_kategooria_omamine_on_seotud_Kaup FOREIGN KEY (kaup_kood) REFERENCES Kaup (kaup_kood) ON DELETE Cascade ON UPDATE Cascade,
    CONSTRAINT FK_Kaubale_kategooria_omamine_on_seotud_Kaup_kategooria FOREIGN KEY (kauba_kategooria_kood) REFERENCES Kaup_kategooria (kauba_kategooria_kood) ON DELETE No Action ON UPDATE Cascade
)
;

CREATE TABLE Kaup_variant
(
	kaup_kood integer NOT NULL,
	kauba_varv_kood smallint NOT NULL,
	CONSTRAINT PK_Kaup_variant PRIMARY KEY (kaup_kood,kauba_varv_kood),
	CONSTRAINT FK_Kaup_variant_on_seotud_Kaup FOREIGN KEY (kaup_kood) REFERENCES Kaup (kaup_kood) ON DELETE Cascade ON UPDATE Cascade,
	CONSTRAINT FK_Kaup_variant_on_seotud_Varv FOREIGN KEY (kauba_varv_kood) REFERENCES Varv (varv_kood) ON DELETE No Action ON UPDATE Cascade
)
;

CREATE TABLE Nutitelefon
(
	kaup_kood integer NOT NULL,
	on_veekindel boolean NOT NULL DEFAULT false,
	on_sormejaljelugeja boolean NOT NULL DEFAULT false,
	eesmine_kaamera_kood smallint NOT NULL,
	tagumine_kaamera_kood smallint NOT NULL,
	sisemalu_kood smallint NOT NULL,
	diagonaal_kood decimal(2,1) NOT NULL,
	protsessor_kood smallint NOT NULL,
	ekraan_resolutsioon_kood smallint NOT NULL,
	CONSTRAINT PK_Nutitelefon PRIMARY KEY (kaup_kood),
	CONSTRAINT FK_Nutitelefon_on_seotud_Kaup FOREIGN KEY (kaup_kood) REFERENCES Kaup (kaup_kood) ON DELETE Cascade ON UPDATE Cascade,
	CONSTRAINT FK_Nutitelefon_on_seotud_eesmine_Kaamera FOREIGN KEY (eesmine_kaamera_kood) REFERENCES Kaamera (kaamera_kood) ON DELETE No Action ON UPDATE Cascade,
	CONSTRAINT FK_Nutitelefon_on_seotud_tagumine_Kaamera FOREIGN KEY (tagumine_kaamera_kood) REFERENCES Kaamera (kaamera_kood) ON DELETE No Action ON UPDATE Cascade,
	CONSTRAINT FK_Nutitelefon_on_seotud_Sisemalu FOREIGN KEY (sisemalu_kood) REFERENCES Sisemalu (sisemalu_kood) ON DELETE No Action ON UPDATE Cascade,
	CONSTRAINT FK_Nutitelefon_on_seotud_Diagonaal FOREIGN KEY (diagonaal_kood) REFERENCES Diagonaal (diagonaal_kood) ON DELETE No Action ON UPDATE Cascade,
	CONSTRAINT FK_Nutitelefon_on_seotud_Protsessor FOREIGN KEY (protsessor_kood) REFERENCES Protsessor (protsessor_kood) ON DELETE No Action ON UPDATE Cascade,
	CONSTRAINT FK_Nutitelefon_on_seotud_Ekraan_resolutsioon FOREIGN KEY (ekraan_resolutsioon_kood) REFERENCES Ekraan_resolutsioon (ekraan_resolutsioon_kood) ON DELETE No Action ON UPDATE Cascade
)
;

CREATE INDEX IXFK_Kauba_kategooria_tyyp ON Kaup_kategooria(kauba_kategooria_tyyp_kood ASC);
CREATE INDEX IXFK_Isiku_seisundi_liik ON Isik(isiku_seisundi_liik_kood ASC);
CREATE INDEX IXFK_Riik ON Isik(isikukood_riik ASC);
CREATE INDEX IXFK_Kliendi_seisundi_liik ON Klient(kliendi_seisundi_liik_kood ASC);
CREATE INDEX IXFK_Amet ON Tootaja(amet_kood ASC);
CREATE INDEX IXFK_Tootaja_seisundi_liik ON Tootaja(tootaja_seisundi_liik_kood ASC);
CREATE INDEX IXFK_Brand ON Kaup(brand_kood ASC);
CREATE INDEX IXFK_Kauba_seisundi_liik ON Kaup(kauba_seisundi_liik_kood ASC);
CREATE INDEX IXFK_Kaup_kategooria ON Kaubale_kategooria_omamine(kauba_kategooria_kood ASC);
CREATE INDEX IXFK_Varv ON Kaup_variant(kauba_varv_kood ASC);
CREATE INDEX IXFK_Diagonaal ON Nutitelefon(diagonaal_kood ASC);
CREATE INDEX IXFK_Eesmine_kaamera ON Nutitelefon(eesmine_kaamera_kood ASC);
CREATE INDEX IXFK_Ekraan_resolutsioon ON Nutitelefon(ekraan_resolutsioon_kood ASC);
CREATE INDEX IXFK_Protsessor ON Nutitelefon(protsessor_kood ASC);
CREATE INDEX IXFK_Sisemalu ON Nutitelefon(sisemalu_kood ASC);
CREATE INDEX IXFK_Tagumine_kaamera ON Nutitelefon(tagumine_kaamera_kood ASC);
CREATE INDEX IXFK_Tootaja ON Kaup(registreerija_id ASC);