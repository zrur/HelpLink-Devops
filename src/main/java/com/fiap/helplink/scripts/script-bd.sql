-- ======================================
-- Script: Criar Banco de Dados HelpLink
-- Projeto: Sistema de Doações
-- Alunos: Arthur (558798), Felipe (556099), Robert (555881)
-- ======================================

-- Limpar tabelas se existirem
DROP TABLE ITEM CASCADE CONSTRAINTS;
DROP TABLE DOACAO CASCADE CONSTRAINTS;
DROP TABLE VOLUNTARIO CASCADE CONSTRAINTS;
DROP TABLE INSTITUICAO CASCADE CONSTRAINTS;
DROP TABLE USUARIO CASCADE CONSTRAINTS;

-- Criar sequences
CREATE SEQUENCE SEQ_USUARIO START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_INSTITUICAO START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_DOACAO START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_ITEM START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_VOLUNTARIO START WITH 1 INCREMENT BY 1;

-- 1. Tabela USUARIO
CREATE TABLE USUARIO (
                         id_usuario NUMBER PRIMARY KEY,
                         nome VARCHAR2(100) NOT NULL,
                         email VARCHAR2(100) UNIQUE NOT NULL,
                         senha VARCHAR2(255) NOT NULL,
                         telefone VARCHAR2(20),
                         data_cadastro DATE DEFAULT SYSDATE,
                         ativo CHAR(1) DEFAULT 'S' CHECK (ativo IN ('S', 'N'))
);

-- 2. Tabela INSTITUICAO
CREATE TABLE INSTITUICAO (
                             id_instituicao NUMBER PRIMARY KEY,
                             nome VARCHAR2(150) NOT NULL,
                             cnpj VARCHAR2(18) UNIQUE NOT NULL,
                             endereco VARCHAR2(255),
                             telefone VARCHAR2(20),
                             email VARCHAR2(100),
                             tipo_instituicao VARCHAR2(50),
                             data_cadastro DATE DEFAULT SYSDATE,
                             ativa CHAR(1) DEFAULT 'S' CHECK (ativa IN ('S', 'N'))
);

-- 3. Tabela DOACAO
CREATE TABLE DOACAO (
                        id_doacao NUMBER PRIMARY KEY,
                        id_usuario NUMBER NOT NULL,
                        id_instituicao NUMBER NOT NULL,
                        valor DECIMAL(10, 2),
                        data_doacao DATE DEFAULT SYSDATE,
                        tipo_doacao VARCHAR2(50) CHECK (tipo_doacao IN ('DINHEIRO', 'ITEM', 'SERVICO')),
                        status VARCHAR2(20) DEFAULT 'PENDENTE' CHECK (status IN ('PENDENTE', 'CONFIRMADA', 'CANCELADA')),
                        observacao VARCHAR2(500),
                        CONSTRAINT fk_doacao_usuario FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario) ON DELETE CASCADE,
                        CONSTRAINT fk_doacao_instituicao FOREIGN KEY (id_instituicao) REFERENCES INSTITUICAO(id_instituicao) ON DELETE CASCADE
);

-- 4. Tabela ITEM
CREATE TABLE ITEM (
                      id_item NUMBER PRIMARY KEY,
                      id_doacao NUMBER NOT NULL,
                      nome_item VARCHAR2(100) NOT NULL,
                      descricao VARCHAR2(255),
                      quantidade NUMBER DEFAULT 1,
                      condicao VARCHAR2(50) CHECK (condicao IN ('NOVO', 'USADO_BOM', 'USADO_REGULAR')),
                      CONSTRAINT fk_item_doacao FOREIGN KEY (id_doacao) REFERENCES DOACAO(id_doacao) ON DELETE CASCADE
);

-- 5. Tabela VOLUNTARIO
CREATE TABLE VOLUNTARIO (
                            id_voluntario NUMBER PRIMARY KEY,
                            nome VARCHAR2(100) NOT NULL,
                            email VARCHAR2(100) UNIQUE NOT NULL,
                            telefone VARCHAR2(20),
                            cpf VARCHAR2(14) UNIQUE NOT NULL,
                            area_atuacao VARCHAR2(100),
                            data_cadastro DATE DEFAULT SYSDATE,
                            ativo CHAR(1) DEFAULT 'S' CHECK (ativo IN ('S', 'N'))
);

-- Criar índices para melhor performance
CREATE INDEX idx_usuario_email ON USUARIO(email);
CREATE INDEX idx_instituicao_cnpj ON INSTITUICAO(cnpj);
CREATE INDEX idx_doacao_usuario ON DOACAO(id_usuario);
CREATE INDEX idx_doacao_instituicao ON DOACAO(id_instituicao);
CREATE INDEX idx_doacao_data ON DOACAO(data_doacao);
CREATE INDEX idx_voluntario_email ON VOLUNTARIO(email);

-- Inserir dados de exemplo para teste
INSERT INTO USUARIO VALUES (SEQ_USUARIO.NEXTVAL, 'Arthur Ramos', 'arthur@fiap.com', 'senha123', '11999999999', SYSDATE, 'S');
INSERT INTO USUARIO VALUES (SEQ_USUARIO.NEXTVAL, 'Felipe Melo', 'felipe@fiap.com', 'senha123', '11988888888', SYSDATE, 'S');
INSERT INTO USUARIO VALUES (SEQ_USUARIO.NEXTVAL, 'Robert Coimbra', 'robert@fiap.com', 'senha123', '11977777777', SYSDATE, 'S');

INSERT INTO INSTITUICAO VALUES (SEQ_INSTITUICAO.NEXTVAL, 'Banco de Alimentos', '12.345.678/0001-90', 'Rua A, 123', '1133333333', 'contato@bancoalimentos.org', 'Assistência Social', SYSDATE, 'S');
INSERT INTO INSTITUICAO VALUES (SEQ_INSTITUICAO.NEXTVAL, 'Lar dos Idosos', '98.765.432/0001-10', 'Rua B, 456', '1144444444', 'contato@laridosos.org', 'Assistência à Terceira Idade', SYSDATE, 'S');

INSERT INTO DOACAO VALUES (SEQ_DOACAO.NEXTVAL, 1, 1, 100.00, SYSDATE, 'DINHEIRO', 'CONFIRMADA', 'Doação mensal');
INSERT INTO DOACAO VALUES (SEQ_DOACAO.NEXTVAL, 2, 1, NULL, SYSDATE, 'ITEM', 'PENDENTE', 'Doação de alimentos');

INSERT INTO ITEM VALUES (SEQ_ITEM.NEXTVAL, 2, 'Arroz', 'Pacote de arroz 5kg', 10, 'NOVO');
INSERT INTO ITEM VALUES (SEQ_ITEM.NEXTVAL, 2, 'Feijão', 'Pacote de feijão 1kg', 15, 'NOVO');

INSERT INTO VOLUNTARIO VALUES (SEQ_VOLUNTARIO.NEXTVAL, 'Maria Silva', 'maria@email.com', '11966666666', '123.456.789-00', 'Educação', SYSDATE, 'S');

COMMIT;

-- Verificar dados inseridos
SELECT 'USUARIOS' AS TABELA, COUNT(*) AS TOTAL FROM USUARIO
UNION ALL
SELECT 'INSTITUICOES', COUNT(*) FROM INSTITUICAO
UNION ALL
SELECT 'DOACOES', COUNT(*) FROM DOACAO
UNION ALL
SELECT 'ITENS', COUNT(*) FROM ITEM
UNION ALL
SELECT 'VOLUNTARIOS', COUNT(*) FROM VOLUNTARIO;