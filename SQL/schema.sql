CREATE TABLE TeamsFranchises(
    franchID   VARCHAR(3) NOT NULL PRIMARY KEY,
    franchName VARCHAR(33) NOT NULL,
    active     VARCHAR(2) NOT NULL,
    NAassoc    VARCHAR(3)
);

CREATE TABLE Teams(
    yearID         INTEGER  NOT NULL,
    lgID           VARCHAR(3) NOT NULL,
    teamID         VARCHAR(3) NOT NULL,
    franchID       VARCHAR(3) NOT NULL,
    divID          VARCHAR(1),
    Rank           INTEGER  NOT NULL,
    G              INTEGER  NOT NULL,
    Ghome          INTEGER,
    W              INTEGER  NOT NULL,
    L              INTEGER  NOT NULL,
    DivWin         VARCHAR(1),
    WCWin          VARCHAR(1),
    LgWin          VARCHAR(1),
    WSWin          VARCHAR(1),
    R              INTEGER,
    AB             INTEGER,
    H              INTEGER,
    2B             INTEGER,
    3B             INTEGER,
    HR             INTEGER,
    BB             INTEGER,
    SO             INTEGER,
    SB             INTEGER,
    CS             INTEGER,
    HBP            INTEGER,
    SF             INTEGER,
    RA             INTEGER,
    ER             INTEGER,
    ERA            NUMERIC(5,2),
    CG             INTEGER,
    SHO            INTEGER,
    SV             INTEGER,
    IPouts         INTEGER,
    HA             INTEGER,
    HRA            INTEGER,
    BBA            INTEGER,
    SOA            INTEGER,
    E              INTEGER,
    DP             INTEGER,
    FP             NUMERIC(5,3),
    name           VARCHAR(40) NOT NULL,
    park           VARCHAR(70),
    attendance     INTEGER,
    BPF            INTEGER,
    PPF            INTEGER,
    teamIDBR       VARCHAR(3) NOT NULL,
    teamIDlahman45 VARCHAR(3),
    teamIDretro    VARCHAR(3),

    PRIMARY KEY (yearID, teamID, lgID)
);

CREATE TABLE People(
    ID           INTEGER NOT NULL PRIMARY KEY,
    playerID     VARCHAR(9) NOT NULL,
    birthYear    INTEGER,
    birthMonth   INTEGER,
    birthDay     INTEGER,
    birthCity    VARCHAR(33),
    birthCountry VARCHAR(19),
    birthState   VARCHAR(26),
    deathYear    INTEGER,
    deathMonth   INTEGER,
    deathDay     INTEGER,
    deathCountry VARCHAR(19),
    deathState   VARCHAR(23),
    deathCity    VARCHAR(26),
    nameFirst    VARCHAR(16),
    nameLast     VARCHAR(18) NOT NULL,
    nameGiven    VARCHAR(43) NOT NULL,
    weightlbs       INTEGER,
    heightin       INTEGER,
    bats         VARCHAR(1),
    throws       VARCHAR(1),
    debut        VARCHAR(10),
    bbrefID      VARCHAR(9),
    finalGame    VARCHAR(10),
    retroID      VARCHAR(8)
);

CREATE TABLE Appearances(
    yearID    INTEGER  NOT NULL,
    teamID    VARCHAR(3) NOT NULL REFERENCES Teams(teamID),
    lgID      VARCHAR(3) NOT NULL,
    playerID  VARCHAR(9) NOT NULL REFERENCES People(playerID),
    G_all     INTEGER NOT NULL,
    GS        INTEGER,
    G_batting INTEGER,
    G_defense INTEGER,
    G_p       INTEGER,
    G_c       INTEGER,
    G_1b      INTEGER,
    G_2b      INTEGER,
    G_3b      INTEGER,
    G_ss      INTEGER,
    G_lf      INTEGER,
    G_cf      INTEGER,
    G_rf      INTEGER,
    G_of      INTEGER,
    G_dh      INTEGER,
    G_ph      INTEGER,
    G_pr      INTEGER,

    PRIMARY KEY (yearID, teamID, lgID, playerID)
);

CREATE TABLE Batting(
    playerID VARCHAR(9) NOT NULL REFERENCES People(playerID),
    yearID   INTEGER  NOT NULL,
    stint    INTEGER  NOT NULL,
    teamID   VARCHAR(3) NOT NULL REFERENCES Teams(teamID),
    lgID     VARCHAR(3) NOT NULL,
    G        INTEGER  NOT NULL,
    AB       INTEGER  NOT NULL,
    R        INTEGER  NOT NULL,
    H        INTEGER  NOT NULL,
    2B       INTEGER  NOT NULL,
    3B       INTEGER  NOT NULL,
    HR       INTEGER  NOT NULL,
    RBI      INTEGER,
    SB       INTEGER,
    CS       INTEGER,
    BB       INTEGER  NOT NULL,
    SO       INTEGER,
    IBB      INTEGER,
    HBP      INTEGER,
    SH       INTEGER,
    SF       INTEGER,
    GIDP     INTEGER,

    PRIMARY KEY (playerID, yearID, stint, teamID, lgID)
);

CREATE TABLE Fielding(
    playerID VARCHAR(9) NOT NULL REFERENCES People(playerID),
    yearID   INTEGER  NOT NULL,
    stint    INTEGER  NOT NULL,
    teamID   VARCHAR(3) NOT NULL REFERENCES Teams(teamID),
    lgID     VARCHAR(3) NOT NULL,
    POS      VARCHAR(2) NOT NULL,
    G        INTEGER  NOT NULL,
    GS       INTEGER,
    InnOuts  INTEGER,
    PO       INTEGER,
    A        INTEGER, 
    E        INTEGER, 
    DP       INTEGER, 
    PB       INTEGER, 
    WP       INTEGER, 
    SB       INTEGER, 
    CS       INTEGER, 
    ZR       INTEGER,

    PRIMARY KEY (playerID, yearID, stint, teamID, lgID, POS)
);

CREATE TABLE FieldingOF(
    playerID VARCHAR(9) NOT NULL REFERENCES People(playerID),
    yearID   INTEGER  NOT NULL,
    stint    INTEGER  NOT NULL,
    Glf      INTEGER,
    Gcf      INTEGER,
    Grf      INTEGER,

    PRIMARY KEY (playerID, yearID, stint)
);

CREATE TABLE FieldingOFsplit(
    playerID VARCHAR(9) NOT NULL REFERENCES People(playerID),
    yearID   INTEGER  NOT NULL,
    stint    INTEGER  NOT NULL,
    teamID   VARCHAR(3) NOT NULL REFERENCES Teams(teamID),
    lgID     VARCHAR(3) NOT NULL,
    POS      VARCHAR(2) NOT NULL,
    G        INTEGER  NOT NULL,
    GS       INTEGER,
    InnOuts  INTEGER  NOT NULL,
    PO       INTEGER,
    A        INTEGER,
    E        INTEGER,
    DP       INTEGER,
    PB       BIT,
    WP       VARCHAR(30),
    SB       BIT,
    CS       BIT,
    ZR       VARCHAR(30),

    PRIMARY KEY (playerID, yearID, stint, teamID, lgID, POS)
);

CREATE TABLE Managers(
    playerID VARCHAR(9) NOT NULL REFERENCES People(playerID),
    yearID   INTEGER  NOT NULL,
    teamID   VARCHAR(3) NOT NULL REFERENCES Teams(teamID),
    lgID     VARCHAR(3) NOT NULL,
    inseason INTEGER  NOT NULL,
    G        INTEGER  NOT NULL,
    W        INTEGER  NOT NULL,
    L        INTEGER  NOT NULL,
    rank     INTEGER  NOT NULL,
    plyrMgr  VARCHAR(1),

    PRIMARY KEY (playerID, yearID, teamID, lgID)
);

CREATE TABLE Parks(
    ID        INTEGER  NOT NULL PRIMARY KEY,
    parkalias VARCHAR(128),
    parkkey   VARCHAR(5) NOT NULL,
    parkname  VARCHAR(44) NOT NULL,
    city      VARCHAR(19) NOT NULL,
    state     VARCHAR(15),
    country   VARCHAR(11) NOT NULL
);

CREATE TABLE Pitching(
    playerID VARCHAR(9) NOT NULL REFERENCES People(playerID),
    yearID   INTEGER  NOT NULL,
    stint    INTEGER  NOT NULL,
    teamID   VARCHAR(3) NOT NULL REFERENCES Teams(teamID),
    lgID     VARCHAR(3) NOT NULL,
    W        INTEGER  NOT NULL,
    L        INTEGER  NOT NULL,
    G        INTEGER  NOT NULL,
    GS       INTEGER  NOT NULL,
    CG       INTEGER  NOT NULL,
    SHO      INTEGER  NOT NULL,
    SV       INTEGER  NOT NULL,
    IPouts   INTEGER  NOT NULL,
    H        INTEGER  NOT NULL,
    ER       INTEGER  NOT NULL,
    HR       INTEGER,
    BB       INTEGER  NOT NULL,
    SO       INTEGER  NOT NULL,
    BAOpp    NUMERIC(6,3),
    ERA      NUMERIC(5,2),
    IBB      INTEGER,
    WP       INTEGER,
    HBP      INTEGER,
    BK       INTEGER,
    BFP      INTEGER,
    GF       INTEGER,
    R        INTEGER  NOT NULL,
    SH       INTEGER,
    SF       INTEGER,
    GIDP     INTEGER,

    PRIMARY KEY (playerID, yearID, stint, teamID, lgID)
);

CREATE TABLE Salaries(
    yearID   INTEGER  NOT NULL,
    teamID   VARCHAR(3) NOT NULL REFERENCES Teams(teamID),
    lgID     VARCHAR(2) NOT NULL,
    playerID VARCHAR(9) NOT NULL REFERENCES People(playerID),
    salary   INTEGER  NOT NULL,

    PRIMARY KEY (yearID, teamID, lgID, playerID)
);