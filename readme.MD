# Projeto HopeTrack

Este repositório contém o script SQL para configurar o banco de dados da aplicação HopeTrack. HopeTrack é uma plataforma que gerencia doadores, doações e instituições de caridade.

## Configuração do Banco de Dados

### Pré-requisitos

- MySQL Server instalado localmente ou em um servidor acessível.

### Script SQL

Para configurar o banco de dados HopeTrack, execute os seguintes comandos SQL no seu servidor MySQL:

```sql
CREATE DATABASE HopeTrack;
USE HopeTrack;

-- Tabela Donator
CREATE TABLE Donator (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    email VARCHAR(20) UNIQUE NOT NULL
);

-- Tabela Donation
CREATE TABLE Donation (
    id INT PRIMARY KEY AUTO_INCREMENT,
    amount DOUBLE PRECISION NOT NULL,
    donation_date DATE NOT NULL,
    payment_receipt_link VARCHAR(78),
    donator_id INT,
    FOREIGN KEY (donator_id) REFERENCES Donator(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabela Charity
CREATE TABLE Charity (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) UNIQUE NOT NULL,
    description TEXT NOT NULL,
    identification CHAR(14) NOT NULL
);

-- Tabela Donator_Charity
CREATE TABLE Donator_Charity (
    donator_id INT,
    charity_id INT,
    PRIMARY KEY (donator_id, charity_id),
    FOREIGN KEY (donator_id) REFERENCES Donator(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (charity_id) REFERENCES Charity(id) ON DELETE CASCADE ON UPDATE CASCADE
);
