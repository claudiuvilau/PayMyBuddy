# paymybuddy


CREATE TABLE public.utilisateur (
                email VARCHAR(100) NOT NULL,
                nom VARCHAR(30) NOT NULL,
                prenom VARCHAR(50) NOT NULL,
                mdp VARCHAR(100) NOT NULL,
                date_solde DATE NOT NULL,
                solde NUMERIC(6,2) NOT NULL,
                CONSTRAINT utilisateur_pk PRIMARY KEY (email)
);


CREATE SEQUENCE public.transactions_id_seq;

CREATE TABLE public.transactions (
                id INTEGER NOT NULL DEFAULT nextval('public.transactions_id_seq'),
                date_operation DATE NOT NULL,
                utilisateur_email_operation VARCHAR(100) NOT NULL,
                email_debit VARCHAR(100) NOT NULL,
                email_credit VARCHAR(100) NOT NULL,
                montant NUMERIC(6,2) NOT NULL,
                type_operation INTEGER NOT NULL,
                description VARCHAR(100) NOT NULL,
                no_crt_compte INTEGER NOT NULL,
                frais NUMERIC(6,2) NOT NULL,
                date_facture DATE NOT NULL,
                facture VARCHAR(20) NOT NULL,
                CONSTRAINT transactions_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.transactions_id_seq OWNED BY public.transactions.id;

CREATE TABLE public.compte_bancaire (
                swift VARCHAR(20) NOT NULL,
                iban VARCHAR(50) NOT NULL,
                utilisateur_email VARCHAR(100) NOT NULL,
                no_crt_compte INTEGER NOT NULL,
                CONSTRAINT compte_bancaire_pk PRIMARY KEY (swift, iban)
);


CREATE SEQUENCE public.list_amis_id_seq;

CREATE TABLE public.list_amis (
                id INTEGER NOT NULL DEFAULT nextval('public.list_amis_id_seq'),
                utilisateur_email VARCHAR(100) NOT NULL,
                email_ami VARCHAR(100) NOT NULL,
                nom VARCHAR(30) NOT NULL,
                prenom VARCHAR(50) NOT NULL,
                CONSTRAINT list_amis_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.list_amis_id_seq OWNED BY public.list_amis.id;

ALTER TABLE public.list_amis ADD CONSTRAINT utilisateur_list_amis_fk
FOREIGN KEY (utilisateur_email)
REFERENCES public.utilisateur (email)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.compte_bancaire ADD CONSTRAINT utilisateur_compte_bancaire_fk
FOREIGN KEY (utilisateur_email)
REFERENCES public.utilisateur (email)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.transactions ADD CONSTRAINT utilisateur_transactions_fk
FOREIGN KEY (utilisateur_email_operation)
REFERENCES public.utilisateur (email)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
