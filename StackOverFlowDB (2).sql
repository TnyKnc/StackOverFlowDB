--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6
-- Dumped by pg_dump version 9.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Admin" (
    "RutbeID" integer NOT NULL,
    "RutbeOnceligi" integer,
    "YetkiID" integer,
    "RutbeYukseltenID" integer
);


ALTER TABLE "Admin" OWNER TO postgres;

--
-- Name: Arama; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Arama" (
    "AramaID" integer NOT NULL,
    "Aranan" character varying,
    "AranmaTarihi" date,
    "ArayanID" integer
);


ALTER TABLE "Arama" OWNER TO postgres;

--
-- Name: CopKutusu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "CopKutusu" (
    "CopKutusuID" integer NOT NULL,
    "KapatmaID" integer,
    "SilinmeZamani" date,
    "SilenID" integer
);


ALTER TABLE "CopKutusu" OWNER TO postgres;

--
-- Name: Duzenleme; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Duzenleme" (
    "DuzenlemeID" integer NOT NULL,
    "DuzenleyenID" integer,
    "DuzenlemeTarihi" date,
    "DuzenlemeSayisi" integer
);


ALTER TABLE "Duzenleme" OWNER TO postgres;

--
-- Name: Etiket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Etiket" (
    "EtiketID" integer NOT NULL,
    "EtiketAdi" character varying NOT NULL,
    "OlusturulmaTarihi" date,
    "KullanilmaSayisi" integer,
    "AramaID" integer
);


ALTER TABLE "Etiket" OWNER TO postgres;

--
-- Name: Goruntuleme; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Goruntuleme" (
    "GoruntulenenID" integer NOT NULL,
    "GoruntulemeTarihi" date,
    "GoruntulemeSuresi" integer
);


ALTER TABLE "Goruntuleme" OWNER TO postgres;

--
-- Name: IsIlani; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "IsIlani" (
    "IsIlaniID" integer NOT NULL,
    "IlanVerenID" integer,
    "IsTipi" character varying,
    "ArananOzellikler" character varying,
    "ArananSeviye" character varying,
    "ArananEtiketler" character varying,
    "GenelBilgiler" character varying,
    "BasvuranID" integer,
    "KonumID" integer
);


ALTER TABLE "IsIlani" OWNER TO postgres;

--
-- Name: IsIlaniEtiket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "IsIlaniEtiket" (
    "IsIlaniEtiketID" integer NOT NULL,
    "IsIlaniID" integer,
    "EtiketID" integer
);


ALTER TABLE "IsIlaniEtiket" OWNER TO postgres;

--
-- Name: Kapatma; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Kapatma" (
    "KapatmaID" integer NOT NULL,
    "KapatmaTarihi" date,
    "KapatilanID" integer,
    "KapatanKullaniciID" integer,
    "KapatmaNedeni" character varying(300)
);


ALTER TABLE "Kapatma" OWNER TO postgres;

--
-- Name: Konum; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Konum" (
    "KonumID" integer NOT NULL,
    "Il" character varying,
    "Ilce" character varying,
    "Mahalle" character varying,
    "Sokak" character varying,
    "BinaNo" character varying
);


ALTER TABLE "Konum" OWNER TO postgres;

--
-- Name: Kullanicilar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Kullanicilar" (
    "KullaniciID" integer NOT NULL,
    "KullaniciAdi" character varying(40) NOT NULL,
    "EmailAdresi" character varying(30) NOT NULL,
    "ProfilResmi" bytea,
    "Sifre" character varying NOT NULL,
    "KayıtTarihi" date NOT NULL,
    "SonGirisTarihi" date NOT NULL,
    "WebAdresi" character varying(30) NOT NULL,
    "Hakkinda" character varying,
    "Yas" integer,
    "GoruntulemeID" integer,
    "OylamaID" integer,
    "SoruID" integer,
    "YorumID" integer,
    "RutbeID" integer,
    "KapatmaID" integer,
    "KonumID" integer
);


ALTER TABLE "Kullanicilar" OWNER TO postgres;

--
-- Name: Mesaj; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Mesaj" (
    "MesajID" integer NOT NULL,
    "GonderenID" integer,
    "AlanID" integer,
    "GonderimZamani" date,
    "OkunmaDurumu" bytea DEFAULT '\x30'::bytea
);


ALTER TABLE "Mesaj" OWNER TO postgres;

--
-- Name: Moderator; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Moderator" (
    "RutbeID" integer NOT NULL,
    "RutbeOnceligi" integer,
    "YetkiID" integer,
    "RutbeYukseltenID" integer,
    "RutbeDusurenID" integer
);


ALTER TABLE "Moderator" OWNER TO postgres;

--
-- Name: Oylamalar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Oylamalar" (
    "OylamaID" integer NOT NULL,
    "OyVerenKullaniciID" integer,
    "OyID" integer,
    "Tarih" date,
    "RozetID" integer
);


ALTER TABLE "Oylamalar" OWNER TO postgres;

--
-- Name: Oylar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Oylar" (
    "OyID" integer NOT NULL,
    "IyiOy" bytea,
    "KotuOy" bytea
);


ALTER TABLE "Oylar" OWNER TO postgres;

--
-- Name: Paylasim; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Paylasim" (
    "PaylasimID" integer NOT NULL,
    "PaylasanID" integer,
    "PaylastigiYer" "char",
    "PaylasimZamani" date
);


ALTER TABLE "Paylasim" OWNER TO postgres;

--
-- Name: Rozetler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Rozetler" (
    "RozetID" integer NOT NULL,
    "RozetAdi" character varying
);


ALTER TABLE "Rozetler" OWNER TO postgres;

--
-- Name: Rutbe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Rutbe" (
    "RutbeID" integer NOT NULL,
    "RutbeAdi" character varying
);


ALTER TABLE "Rutbe" OWNER TO postgres;

--
-- Name: Sorular; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Sorular" (
    "SoruID" integer NOT NULL,
    "KullaniciID" integer,
    "Konu" character varying NOT NULL,
    "SoruBasligi" character varying NOT NULL,
    "SoruIcerigi" character varying NOT NULL,
    "KabulDurumu" boolean DEFAULT false NOT NULL,
    "OlusturulmaTarihi" daterange NOT NULL,
    "YorumID" integer,
    "OylamaID" integer,
    "GoruntulemeID" integer,
    "DuzenlemeID" integer,
    "EtiketID" integer NOT NULL,
    "OkunmaSayisi" integer DEFAULT 0 NOT NULL,
    "PaylasimID" integer
);


ALTER TABLE "Sorular" OWNER TO postgres;

--
-- Name: Uye; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Uye" (
    "RutbeID" integer NOT NULL,
    "RutbeOnceligi" integer,
    "YetkiID" integer,
    "RutbeYukseltenID" integer,
    "RutbeDusurenID" integer
);


ALTER TABLE "Uye" OWNER TO postgres;

--
-- Name: Yetkiler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Yetkiler" (
    "YetkiID" integer NOT NULL,
    "Yetki" character varying,
    "YetkiyeAcikRutbeID" integer
);


ALTER TABLE "Yetkiler" OWNER TO postgres;

--
-- Name: Yorumlar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Yorumlar" (
    "YorumID" integer NOT NULL,
    "OylamaID" integer,
    "YorumIcerigi" character varying,
    "OlusturulmaTarihi" date,
    "KullaniciID" integer,
    "DuzenlemeID" integer
);


ALTER TABLE "Yorumlar" OWNER TO postgres;

--
-- Name: Admin Admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Admin"
    ADD CONSTRAINT "Admin_pkey" PRIMARY KEY ("RutbeID");


--
-- Name: Arama Arama_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Arama"
    ADD CONSTRAINT "Arama_pkey" PRIMARY KEY ("AramaID");


--
-- Name: CopKutusu CopKutusu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "CopKutusu"
    ADD CONSTRAINT "CopKutusu_pkey" PRIMARY KEY ("CopKutusuID");


--
-- Name: Duzenleme Duzenleme_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Duzenleme"
    ADD CONSTRAINT "Duzenleme_pkey" PRIMARY KEY ("DuzenlemeID");


--
-- Name: Etiket Etiket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Etiket"
    ADD CONSTRAINT "Etiket_pkey" PRIMARY KEY ("EtiketID");


--
-- Name: Goruntuleme Goruntuleme_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Goruntuleme"
    ADD CONSTRAINT "Goruntuleme_pkey" PRIMARY KEY ("GoruntulenenID");


--
-- Name: IsIlaniEtiket IsIlaniEtiket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "IsIlaniEtiket"
    ADD CONSTRAINT "IsIlaniEtiket_pkey" PRIMARY KEY ("IsIlaniEtiketID");


--
-- Name: IsIlani IsIlani_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "IsIlani"
    ADD CONSTRAINT "IsIlani_pkey" PRIMARY KEY ("IsIlaniID");


--
-- Name: Kapatma Kapatma_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Kapatma"
    ADD CONSTRAINT "Kapatma_pkey" PRIMARY KEY ("KapatmaID");


--
-- Name: Konum Konum_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Konum"
    ADD CONSTRAINT "Konum_pkey" PRIMARY KEY ("KonumID");


--
-- Name: Kullanicilar Kullanicilar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Kullanicilar"
    ADD CONSTRAINT "Kullanicilar_pkey" PRIMARY KEY ("KullaniciID");


--
-- Name: Mesaj Mesaj_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Mesaj"
    ADD CONSTRAINT "Mesaj_pkey" PRIMARY KEY ("MesajID");


--
-- Name: Moderator Moderator_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Moderator"
    ADD CONSTRAINT "Moderator_pkey" PRIMARY KEY ("RutbeID");


--
-- Name: Oylamalar Oylamalar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Oylamalar"
    ADD CONSTRAINT "Oylamalar_pkey" PRIMARY KEY ("OylamaID");


--
-- Name: Oylar Oylar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Oylar"
    ADD CONSTRAINT "Oylar_pkey" PRIMARY KEY ("OyID");


--
-- Name: Paylasim Paylasim_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Paylasim"
    ADD CONSTRAINT "Paylasim_pkey" PRIMARY KEY ("PaylasimID");


--
-- Name: Rozetler Rozetler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Rozetler"
    ADD CONSTRAINT "Rozetler_pkey" PRIMARY KEY ("RozetID");


--
-- Name: Rutbe Rutbe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Rutbe"
    ADD CONSTRAINT "Rutbe_pkey" PRIMARY KEY ("RutbeID");


--
-- Name: Sorular SoruID_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sorular"
    ADD CONSTRAINT "SoruID_pkey" PRIMARY KEY ("SoruID");


--
-- Name: Uye Uye_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Uye"
    ADD CONSTRAINT "Uye_pkey" PRIMARY KEY ("RutbeID");


--
-- Name: Yetkiler Yetkiler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Yetkiler"
    ADD CONSTRAINT "Yetkiler_pkey" PRIMARY KEY ("YetkiID");


--
-- Name: Yorumlar Yorumlar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Yorumlar"
    ADD CONSTRAINT "Yorumlar_pkey" PRIMARY KEY ("YorumID");


--
-- Name: fki_AlanKullanici_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_AlanKullanici_fkey" ON "Mesaj" USING btree ("AlanID");


--
-- Name: fki_Arama_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Arama_fkey" ON "Etiket" USING btree ("AramaID");


--
-- Name: fki_Arayan_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Arayan_fkey" ON "Arama" USING btree ("ArayanID");


--
-- Name: fki_Basvuran_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Basvuran_fkey" ON "IsIlani" USING btree ("BasvuranID");


--
-- Name: fki_D; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_D" ON "Yorumlar" USING btree ("DuzenlemeID");


--
-- Name: fki_Duzenleme_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Duzenleme_fkey" ON "Sorular" USING btree ("DuzenlemeID");


--
-- Name: fki_Duzenleyen_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Duzenleyen_fkey" ON "Duzenleme" USING btree ("DuzenleyenID");


--
-- Name: fki_Etiket_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Etiket_fkey" ON "IsIlaniEtiket" USING btree ("EtiketID");


--
-- Name: fki_GonderenKullanici_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_GonderenKullanici_fkey" ON "Mesaj" USING btree ("GonderenID");


--
-- Name: fki_Goruntuleme_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Goruntuleme_fkey" ON "Kullanicilar" USING btree ("GoruntulemeID");


--
-- Name: fki_IsIlani.fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_IsIlani.fkey" ON "IsIlaniEtiket" USING btree ("IsIlaniID");


--
-- Name: fki_KapatanKullanici_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_KapatanKullanici_fkey" ON "Kapatma" USING btree ("KapatanKullaniciID");


--
-- Name: fki_KapatilanKullanici_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_KapatilanKullanici_fkey" ON "Kapatma" USING btree ("KapatilanID");


--
-- Name: fki_Kapatma_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Kapatma_fkey" ON "CopKutusu" USING btree ("KapatmaID");


--
-- Name: fki_Konum_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Konum_fkey" ON "IsIlani" USING btree ("IlanVerenID");


--
-- Name: fki_KullaniciKapatma_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_KullaniciKapatma_fkey" ON "Kullanicilar" USING btree ("KapatmaID");


--
-- Name: fki_OyVeren_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_OyVeren_fkey" ON "Oylamalar" USING btree ("OyVerenKullaniciID");


--
-- Name: fki_Oy_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Oy_fkey" ON "Oylamalar" USING btree ("OyID");


--
-- Name: fki_Oylama_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Oylama_fkey" ON "Kullanicilar" USING btree ("OylamaID");


--
-- Name: fki_PaylasanKullanici_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_PaylasanKullanici_fkey" ON "Paylasim" USING btree ("PaylasanID");


--
-- Name: fki_Rozet_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Rozet_fkey" ON "Oylamalar" USING btree ("RozetID");


--
-- Name: fki_Ru; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Ru" ON "Admin" USING btree ("RutbeYukseltenID");


--
-- Name: fki_RutbeDusuren_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_RutbeDusuren_fkey" ON "Moderator" USING btree ("RutbeDusurenID");


--
-- Name: fki_RutbeYukselten_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_RutbeYukselten_fkey" ON "Moderator" USING btree ("RutbeYukseltenID");


--
-- Name: fki_Rutbe_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Rutbe_fkey" ON "Kullanicilar" USING btree ("RutbeID");


--
-- Name: fki_SilenKullanici_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_SilenKullanici_fkey" ON "CopKutusu" USING btree ("SilenID");


--
-- Name: fki_SoranKullanici_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_SoranKullanici_fkey" ON "Sorular" USING btree ("KullaniciID");


--
-- Name: fki_SoruEtiket_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_SoruEtiket_fkey" ON "Sorular" USING btree ("EtiketID");


--
-- Name: fki_SoruGoruntuleme_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_SoruGoruntuleme_fkey" ON "Sorular" USING btree ("GoruntulemeID");


--
-- Name: fki_SoruOylama_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_SoruOylama_fkey" ON "Sorular" USING btree ("OylamaID");


--
-- Name: fki_SoruPaylasim_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_SoruPaylasim_fkey" ON "Sorular" USING btree ("PaylasimID");


--
-- Name: fki_SoruYorumlari_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_SoruYorumlari_fkey" ON "Sorular" USING btree ("YorumID");


--
-- Name: fki_Soru_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Soru_fkey" ON "Kullanicilar" USING btree ("SoruID");


--
-- Name: fki_UyeRutbeDusuren_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_UyeRutbeDusuren_fkey" ON "Uye" USING btree ("RutbeDusurenID");


--
-- Name: fki_UyeRutbeYukselten_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_UyeRutbeYukselten_fkey" ON "Uye" USING btree ("RutbeYukseltenID");


--
-- Name: fki_Yetki; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Yetki" ON "Uye" USING btree ("YetkiID");


--
-- Name: fki_Yetki_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Yetki_fkey" ON "Moderator" USING btree ("YetkiID");


--
-- Name: fki_YetkiyeAcikRutbe_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_YetkiyeAcikRutbe_fkey" ON "Yetkiler" USING btree ("YetkiyeAcikRutbeID");


--
-- Name: fki_YorumOylama_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_YorumOylama_fkey" ON "Yorumlar" USING btree ("OylamaID");


--
-- Name: fki_YorumYapanKullanici_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_YorumYapanKullanici_fkey" ON "Yorumlar" USING btree ("KullaniciID");


--
-- Name: fki_Yorum_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Yorum_fkey" ON "Kullanicilar" USING btree ("YorumID");


--
-- Name: fki_konum_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_konum_fkey ON "Kullanicilar" USING btree ("KonumID");


--
-- Name: fki_yetki_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_yetki_fkey ON "Admin" USING btree ("YetkiID");


--
-- Name: Mesaj AlanKullanici_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Mesaj"
    ADD CONSTRAINT "AlanKullanici_fkey" FOREIGN KEY ("AlanID") REFERENCES "Kullanicilar"("KullaniciID");


--
-- Name: Etiket Arama_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Etiket"
    ADD CONSTRAINT "Arama_fkey" FOREIGN KEY ("AramaID") REFERENCES "Arama"("AramaID");


--
-- Name: IsIlani Basvuran_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "IsIlani"
    ADD CONSTRAINT "Basvuran_fkey" FOREIGN KEY ("BasvuranID") REFERENCES "Kullanicilar"("KullaniciID");


--
-- Name: Duzenleme Duzenleyen_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Duzenleme"
    ADD CONSTRAINT "Duzenleyen_fkey" FOREIGN KEY ("DuzenleyenID") REFERENCES "Kullanicilar"("KullaniciID");


--
-- Name: Arama EtiketArama_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Arama"
    ADD CONSTRAINT "EtiketArama_fkey" FOREIGN KEY ("AramaID") REFERENCES "Etiket"("EtiketID");


--
-- Name: IsIlaniEtiket Etiket_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "IsIlaniEtiket"
    ADD CONSTRAINT "Etiket_fkey" FOREIGN KEY ("EtiketID") REFERENCES "Etiket"("EtiketID");


--
-- Name: Mesaj GonderenKullanici_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Mesaj"
    ADD CONSTRAINT "GonderenKullanici_fkey" FOREIGN KEY ("GonderenID") REFERENCES "Kullanicilar"("KullaniciID");


--
-- Name: Kullanicilar Goruntuleme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Kullanicilar"
    ADD CONSTRAINT "Goruntuleme_fkey" FOREIGN KEY ("GoruntulemeID") REFERENCES "Goruntuleme"("GoruntulenenID");


--
-- Name: IsIlani IlanVeren_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "IsIlani"
    ADD CONSTRAINT "IlanVeren_fkey" FOREIGN KEY ("IlanVerenID") REFERENCES "Kullanicilar"("KullaniciID");


--
-- Name: IsIlaniEtiket IsIlani.fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "IsIlaniEtiket"
    ADD CONSTRAINT "IsIlani.fkey" FOREIGN KEY ("IsIlaniID") REFERENCES "IsIlani"("IsIlaniID");


--
-- Name: Kapatma KapatanKullanici_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Kapatma"
    ADD CONSTRAINT "KapatanKullanici_fkey" FOREIGN KEY ("KapatanKullaniciID") REFERENCES "Kullanicilar"("KullaniciID");


--
-- Name: Kapatma KapatilanKullanici_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Kapatma"
    ADD CONSTRAINT "KapatilanKullanici_fkey" FOREIGN KEY ("KapatilanID") REFERENCES "Kullanicilar"("KullaniciID");


--
-- Name: CopKutusu Kapatma_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "CopKutusu"
    ADD CONSTRAINT "Kapatma_fkey" FOREIGN KEY ("KapatmaID") REFERENCES "Kapatma"("KapatmaID");


--
-- Name: Kullanicilar Kapatma_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Kullanicilar"
    ADD CONSTRAINT "Kapatma_fkey" FOREIGN KEY ("KapatmaID") REFERENCES "Kapatma"("KapatmaID");


--
-- Name: IsIlani Konum_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "IsIlani"
    ADD CONSTRAINT "Konum_fkey" FOREIGN KEY ("IlanVerenID") REFERENCES "Kullanicilar"("KullaniciID");


--
-- Name: Kullanicilar KullaniciKapatma_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Kullanicilar"
    ADD CONSTRAINT "KullaniciKapatma_fkey" FOREIGN KEY ("KapatmaID") REFERENCES "Kapatma"("KapatmaID");


--
-- Name: Oylamalar OyVeren_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Oylamalar"
    ADD CONSTRAINT "OyVeren_fkey" FOREIGN KEY ("OyVerenKullaniciID") REFERENCES "Kullanicilar"("KullaniciID");


--
-- Name: Oylamalar Oy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Oylamalar"
    ADD CONSTRAINT "Oy_fkey" FOREIGN KEY ("OyID") REFERENCES "Oylar"("OyID");


--
-- Name: Kullanicilar Oylama_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Kullanicilar"
    ADD CONSTRAINT "Oylama_fkey" FOREIGN KEY ("OylamaID") REFERENCES "Oylamalar"("OylamaID");


--
-- Name: Paylasim PaylasanKullanici_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Paylasim"
    ADD CONSTRAINT "PaylasanKullanici_fkey" FOREIGN KEY ("PaylasanID") REFERENCES "Kullanicilar"("KullaniciID");


--
-- Name: Oylamalar Rozet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Oylamalar"
    ADD CONSTRAINT "Rozet_fkey" FOREIGN KEY ("RozetID") REFERENCES "Rozetler"("RozetID");


--
-- Name: Moderator RutbeDusuren_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Moderator"
    ADD CONSTRAINT "RutbeDusuren_fkey" FOREIGN KEY ("RutbeDusurenID") REFERENCES "Kullanicilar"("KullaniciID");


--
-- Name: Admin RutbeYukselten_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Admin"
    ADD CONSTRAINT "RutbeYukselten_fkey" FOREIGN KEY ("RutbeYukseltenID") REFERENCES "Kullanicilar"("KullaniciID");


--
-- Name: Moderator RutbeYukselten_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Moderator"
    ADD CONSTRAINT "RutbeYukselten_fkey" FOREIGN KEY ("RutbeYukseltenID") REFERENCES "Kullanicilar"("KullaniciID");


--
-- Name: Admin Rutbe_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Admin"
    ADD CONSTRAINT "Rutbe_fkey" FOREIGN KEY ("RutbeID") REFERENCES "Rutbe"("RutbeID");


--
-- Name: Kullanicilar Rutbe_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Kullanicilar"
    ADD CONSTRAINT "Rutbe_fkey" FOREIGN KEY ("RutbeID") REFERENCES "Rutbe"("RutbeID");


--
-- Name: CopKutusu SilenKullanici_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "CopKutusu"
    ADD CONSTRAINT "SilenKullanici_fkey" FOREIGN KEY ("SilenID") REFERENCES "Kullanicilar"("KullaniciID");


--
-- Name: Sorular SoranKullanici_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sorular"
    ADD CONSTRAINT "SoranKullanici_fkey" FOREIGN KEY ("KullaniciID") REFERENCES "Kullanicilar"("KullaniciID");


--
-- Name: Sorular SoruDuzenleme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sorular"
    ADD CONSTRAINT "SoruDuzenleme_fkey" FOREIGN KEY ("DuzenlemeID") REFERENCES "Duzenleme"("DuzenlemeID");


--
-- Name: Sorular SoruEtiket_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sorular"
    ADD CONSTRAINT "SoruEtiket_fkey" FOREIGN KEY ("EtiketID") REFERENCES "Etiket"("EtiketID");


--
-- Name: Sorular SoruGoruntuleme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sorular"
    ADD CONSTRAINT "SoruGoruntuleme_fkey" FOREIGN KEY ("GoruntulemeID") REFERENCES "Goruntuleme"("GoruntulenenID");


--
-- Name: Sorular SoruOylama_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sorular"
    ADD CONSTRAINT "SoruOylama_fkey" FOREIGN KEY ("OylamaID") REFERENCES "Oylamalar"("OylamaID");


--
-- Name: Sorular SoruPaylasim_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sorular"
    ADD CONSTRAINT "SoruPaylasim_fkey" FOREIGN KEY ("PaylasimID") REFERENCES "Paylasim"("PaylasimID");


--
-- Name: Sorular SoruYorumlari_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sorular"
    ADD CONSTRAINT "SoruYorumlari_fkey" FOREIGN KEY ("YorumID") REFERENCES "Yorumlar"("YorumID");


--
-- Name: Kullanicilar Soru_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Kullanicilar"
    ADD CONSTRAINT "Soru_fkey" FOREIGN KEY ("SoruID") REFERENCES "Sorular"("SoruID");


--
-- Name: Uye UyeRutbeDusuren_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Uye"
    ADD CONSTRAINT "UyeRutbeDusuren_fkey" FOREIGN KEY ("RutbeDusurenID") REFERENCES "Kullanicilar"("KullaniciID");


--
-- Name: Uye UyeRutbeYukselten_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Uye"
    ADD CONSTRAINT "UyeRutbeYukselten_fkey" FOREIGN KEY ("RutbeYukseltenID") REFERENCES "Kullanicilar"("KullaniciID");


--
-- Name: Uye UyeYetki_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Uye"
    ADD CONSTRAINT "UyeYetki_fkey" FOREIGN KEY ("YetkiID") REFERENCES "Yetkiler"("YetkiID");


--
-- Name: Moderator Yetki_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Moderator"
    ADD CONSTRAINT "Yetki_fkey" FOREIGN KEY ("YetkiID") REFERENCES "Yetkiler"("YetkiID");


--
-- Name: Yetkiler YetkiyeAcikRutbe_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Yetkiler"
    ADD CONSTRAINT "YetkiyeAcikRutbe_fkey" FOREIGN KEY ("YetkiyeAcikRutbeID") REFERENCES "Rutbe"("RutbeID");


--
-- Name: Yorumlar YorumDuzenleme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Yorumlar"
    ADD CONSTRAINT "YorumDuzenleme_fkey" FOREIGN KEY ("DuzenlemeID") REFERENCES "Duzenleme"("DuzenlemeID");


--
-- Name: Yorumlar YorumOylama_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Yorumlar"
    ADD CONSTRAINT "YorumOylama_fkey" FOREIGN KEY ("OylamaID") REFERENCES "Oylamalar"("OylamaID");


--
-- Name: Yorumlar YorumYapanKullanici_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Yorumlar"
    ADD CONSTRAINT "YorumYapanKullanici_fkey" FOREIGN KEY ("KullaniciID") REFERENCES "Kullanicilar"("KullaniciID");


--
-- Name: Kullanicilar Yorum_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Kullanicilar"
    ADD CONSTRAINT "Yorum_fkey" FOREIGN KEY ("YorumID") REFERENCES "Yorumlar"("YorumID");


--
-- Name: Kullanicilar konum_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Kullanicilar"
    ADD CONSTRAINT konum_fkey FOREIGN KEY ("KonumID") REFERENCES "Konum"("KonumID");


--
-- Name: Admin yetki_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Admin"
    ADD CONSTRAINT yetki_fkey FOREIGN KEY ("YetkiID") REFERENCES "Yetkiler"("YetkiID");


--
-- PostgreSQL database dump complete
--

