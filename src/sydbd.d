
//typedef TYPE(*NAME)(PARAMS) => alias NAME = TYPE function(PARAMS);
//<ibuclaw> So: typedef DBWAITFUNC(*DB_DBBUSY_FUNC) (void *dbproc);
//<ibuclaw> becomes: alias DB_DBBUSY_FUN = DBWAITFUNC function (void*);

//http://cdecl.org/

extern (C)
{

//static const char rcsid_sybdb_h[] = "$Id: sybdb.h,v 1.100.2.1 2011/06/06 12:31:45 freddy77 Exp $";
static const char rcsid_sybdb_h[] = "$Id: sybdb.h,v 1.100.2.1 2011/06/06 12:31:45 freddy77 Exp $";

//static const void *const no_unused_sybdb_h_warn[] = { rcsid_sybdb_h, no_unused_sybdb_h_warn };
//static const void *const no_unused_sybdb_h_warn[] = { rcsid_sybdb_h, no_unused_sybdb_h_warn };

//typedef int RETCODE;
alias RETCODE = int;

//typedef void DBCURSOR;
alias DBCURSOR = void;

//typedef void DBXLATE;
alias DBXLATE = void;

//typedef void DBSORTORDER;
alias DBSORTORDER = void;

//typedef void DBLOGINFO;
alias DBLOGINFO = void;

//typedef void *DBVOIDPTR;
alias DBVOIDPTR = void*;

//typedef short SHORT;
alias SHORT = short;

//typedef unsigned short USHORT;
alias USHORT = ushort;

//typedef int (*INTFUNCPTR) (void *, ...);
alias INTFUNCPTR = int function(void*,...);

//typedef int (*DBWAITFUNC) (void);
alias DBWAITFUNC = int function();

//typedef DBWAITFUNC(*DB_DBBUSY_FUNC) (void *dbproc);
alias DB_DBBUSY_FUN = DBWAITFUNC function (void *dbproc);

//typedef void (*DB_DBIDLE_FUNC) (DBWAITFUNC dfunc, void *dbproc);
alias DB_DBIDLE_FUNC = void function(DBWAITFUNC dfunc, void *dbproc);

//typedef int (*DB_DBCHKINTR_FUNC) (void *dbproc);
alias DB_DBCHKINTR_FUNC = int function(void *dbproc);

//typedef int (*DB_DBHNDLINTR_FUNC) (void *dbproc);
alias DB_DBHNDLINTR_FUNC = int function(void *dbproc);

//typedef int STATUS;
alias STATUS = int;

//typedef int BOOL;
alias BOOL = int;

}

enum
{
SYBCHAR = 47,
SYBVARCHAR = 39,
SYBINTN = 38,
SYBINT1 = 48,
SYBINT2 = 52,
SYBINT4 = 56,
SYBINT8 = 127,
SYBFLT8 = 62,
SYBDATETIME = 61,
SYBBIT = 50,
SYBBITN = 104,
SYBTEXT = 35,
SYBNTEXT = 99,
SYBIMAGE = 34,
SYBMONEY4 = 122,
SYBMONEY = 60,
SYBDATETIME4 = 58,
SYBREAL = 59,
SYBBINARY = 45,
SYBVOID = 31,
SYBVARBINARY = 37,
SYBNUMERIC = 108,
SYBDECIMAL = 106,
SYBFLTN = 109,
SYBMONEYN = 110,
SYBDATETIMN = 111,
SYBNVARCHAR = 103
};

//typedef unsigned char DBBOOL;
alias DBBOOL = ubyte;

//typedef char DBCHAR;
alias DBCHAR = char;

//typedef unsigned char DBBIT;
alias DBBIT = ubyte;

//typedef unsigned char DBTINYINT;
alias DBTINYINT = ubyte;

//typedef short DBSMALLINT;
alias DBSMALLINT = short;

//typedef int DBINT;
alias DBINT = int;

//typedef long DBBIGINT;
alias DBBIGINT = long;

//typedef unsigned char DBBINARY;
alias DBBINARY = ubyte;

//typedef float DBREAL;
alias DBREAL = float;

//typedef double DBFLT8;
alias DBFLT8 = double;

//typedef unsigned short DBUSMALLINT;
alias DBUSMALLINT = ushort;

//typedef struct
//{
// DBSMALLINT len;
// char str[256];
//} DBVARYCHAR;
struct DBVARYCHAR
{
DBSMALLINT len;
char str[256];
};

//typedef struct
//{
// DBSMALLINT len;
// unsigned char array[256];
//} DBVARYBIN;
struct DBVARYBIN
{
DBSMALLINT len;
 char array[256];
};

//typedef struct
//{
// unsigned char precision;
// unsigned char scale;
// unsigned char array[33];
//} DBNUMERIC;
struct DBNUMERIC
{
char precision;
char scale;
char array[33];
};

//typedef DBNUMERIC DBDECIMAL;
alias DBDECIMAL = DBNUMERIC;

//typedef struct
//{
// DBINT mnyhigh;
// unsigned int mnylow;
//} DBMONEY;

struct DBMONEY
{
DBINT mnyhigh;
uint mnylow;
};

//typedef struct
//{
// DBINT mny4;
//} DBMONEY4;
struct DBMONEY4
{
DBINT mny4;
};

//typedef struct
//{
// DBINT dtdays;
// DBINT dttime;
//} DBDATETIME;
struct DBDATETIME
{
DBINT dtdays;
DBINT dttime;
};

//typedef struct
//{
// DBUSMALLINT days;
// DBUSMALLINT minutes;
//} DBDATETIME4;
struct DBDATETIME4
{
DBUSMALLINT days;
DBUSMALLINT minutes;
};

//typedef struct tds_dblib_loginrec LOGINREC;
struct LOGINREC;
alias  tds_dblib_loginrec = LOGINREC;

//typedef unsigned char BYTE;
alias BYTE = ubyte;

//typedef struct dbtypeinfo
//{
// DBINT precision;
// DBINT scale;
//} DBTYPEINFO;
struct DBTYPEINFO
{
DBINT precision;
DBINT scale;
} ;
alias dbtypeinfo = DBTYPEINFO;

//struct dbstring
//{
// BYTE *strtext;
// DBINT strtotlen;
// struct dbstring *strnext;
//};
struct dbstring
{
BYTE *strtext;
DBINT strtotlen;
struct dbstring *strnext;
};

//typedef struct dbstring DBSTRING;
struct DBSTRING;
alias dbstring = DBSTRING;

enum
{ MAXCOLNAMELEN = 512 };

//typedef enum { CI_REGULAR=1, CI_ALTERNATE=2, CI_CURSOR=3 } CI_TYPE;
enum CI_TYPE { CI_REGULAR=1, CI_ALTERNATE=2, CI_CURSOR=3 };

//typedef struct
//{
//    DBINT SizeOfStruct;
//    DBCHAR Name[MAXCOLNAMELEN+2];
//    DBCHAR ActualName[MAXCOLNAMELEN+2];
//    DBCHAR TableName[MAXCOLNAMELEN+2];
//    SHORT Type;
//    DBINT UserType;
//    DBINT MaxLength;
//    BYTE Precision;
//    BYTE Scale;
//    BOOL VarLength;
//    BYTE Null;
//    BYTE CaseSensitive;
//    BYTE Updatable;
//    BOOL Identity;
//} DBCOL;
struct DBCOL
{
    DBINT SizeOfStruct;
    DBCHAR Name[MAXCOLNAMELEN+2];
    DBCHAR ActualName[MAXCOLNAMELEN+2];
    DBCHAR TableName[MAXCOLNAMELEN+2];
    SHORT Type;
    DBINT UserType;
    DBINT MaxLength;
    BYTE Precision;
    BYTE Scale;
    BOOL VarLength;
    BYTE Null;
    BYTE CaseSensitive;
    BYTE Updatable;
    BOOL Identity;
};

//typedef struct tds_dblib_dbprocess DBPROCESS;
struct DBPROCESS;
alias tds_dblib_dbprocess = DBPROCESS;

//struct tds_microsoft_dbdaterec
//{
// DBINT year;
// DBINT quarter;
// DBINT month;
// DBINT day;
// DBINT dayofyear;
// DBINT week;
// DBINT weekday;
// DBINT hour;
// DBINT minute;
// DBINT second;
// DBINT millisecond;
// DBINT tzone;
//};
struct tds_microsoft_dbdaterec
{
DBINT year;
DBINT quarter;
DBINT month;
DBINT day;
DBINT dayofyear;
DBINT week;
DBINT weekday;
DBINT hour;
DBINT minute;
DBINT second;
DBINT millisecond;
DBINT tzone;
};

//struct tds_sybase_dbdaterec
//{
// DBINT dateyear;
// DBINT quarter;
// DBINT datemonth;
// DBINT datedmonth;
// DBINT datedyear;
// DBINT week;
// DBINT datedweek;
// DBINT datehour;
// DBINT dateminute;
// DBINT datesecond;
// DBINT datemsecond;
// DBINT datetzone;
//};
struct tds_sybase_dbdaterec
{
DBINT dateyear;
DBINT quarter;
DBINT datemonth;
DBINT datedmonth;
DBINT datedyear;
DBINT week;
DBINT datedweek;
DBINT datehour;
DBINT dateminute;
DBINT datesecond;
DBINT datemsecond;
DBINT datetzone;
};

//typedef struct tds_sybase_dbdaterec DBDATEREC;
struct DBDATEREC;
alias tds_sybase_dbdaterec = DBDATEREC;

//typedef int (*EHANDLEFUNC) (DBPROCESS * dbproc, int severity, int dberr, int oserr, char *dberrstr, char *oserrstr);
alias EHANDLEFUNC = int function(DBPROCESS *dbproc, int severity, int dberr, int oserr, char *dberrstr, char *oserrstr);

//typedef int (*MHANDLEFUNC) (DBPROCESS * dbproc, DBINT msgno, int msgstate, int severity, char *msgtext, char *srvname,
//       char *proc, int line);
alias MHANDLEFUNC = int function(DBPROCESS *dbproc, DBINT msgno, int msgstate, int severity, char *msgtext, char *srvname,
       char *proc, int line);

//BYTE *dbadata(DBPROCESS * dbproc, int computeid, int column);
BYTE *dbadata(DBPROCESS * dbproc, int computeid, int column);

//DBINT dbadlen(DBPROCESS * dbproc, int computeid, int column);
DBINT dbadlen(DBPROCESS * dbproc, int computeid, int column);

//RETCODE dbaltbind(DBPROCESS * dbprocess, int computeid, int column, int vartype, DBINT varlen, BYTE * varaddr);
RETCODE dbaltbind(DBPROCESS * dbprocess, int computeid, int column, int vartype, DBINT varlen, BYTE * varaddr);

//RETCODE dbaltbind_ps(DBPROCESS * dbprocess, int computeid, int column, int vartype, DBINT varlen, BYTE * varaddr,
//       DBTYPEINFO * typeinfo);
RETCODE dbaltbind_ps(DBPROCESS * dbprocess, int computeid, int column, int vartype, DBINT varlen, BYTE * varaddr,
       DBTYPEINFO * typeinfo);

//int dbaltcolid(DBPROCESS * dbproc, int computeid, int column);
int dbaltcolid(DBPROCESS * dbproc, int computeid, int column);

//RETCODE dbaltlen(DBPROCESS * dbproc, int computeid, int column);
RETCODE dbaltlen(DBPROCESS * dbproc, int computeid, int column);

//int dbaltop(DBPROCESS * dbproc, int computeid, int column);
int dbaltop(DBPROCESS * dbproc, int computeid, int column);

//int dbalttype(DBPROCESS * dbproc, int computeid, int column);
int dbalttype(DBPROCESS * dbproc, int computeid, int column);

//RETCODE dbaltutype(DBPROCESS * dbproc, int computeid, int column);
RETCODE dbaltutype(DBPROCESS * dbproc, int computeid, int column);

//RETCODE dbanullbind(DBPROCESS * dbprocess, int computeid, int column, DBINT * indicator);
RETCODE dbanullbind(DBPROCESS * dbprocess, int computeid, int column, DBINT * indicator);

//RETCODE dbbind(DBPROCESS * dbproc, int column, int vartype, DBINT varlen, BYTE * varaddr);
RETCODE dbbind(DBPROCESS * dbproc, int column, int vartype, DBINT varlen, BYTE * varaddr);

//RETCODE dbbind_ps(DBPROCESS * dbprocess, int column, int vartype, DBINT varlen, BYTE * varaddr, DBTYPEINFO * typeinfo);
RETCODE dbbind_ps(DBPROCESS * dbprocess, int column, int vartype, DBINT varlen, BYTE * varaddr, DBTYPEINFO * typeinfo);

//int dbbufsize(DBPROCESS * dbprocess);
int dbbufsize(DBPROCESS * dbprocess);

//BYTE *dbbylist(DBPROCESS * dbproc, int computeid, int *size);
BYTE *dbbylist(DBPROCESS * dbproc, int computeid, int *size);

//RETCODE dbcancel(DBPROCESS * dbproc);
RETCODE dbcancel(DBPROCESS * dbproc);

//RETCODE dbcanquery(DBPROCESS * dbproc);
RETCODE dbcanquery(DBPROCESS * dbproc);

//char *dbchange(DBPROCESS * dbprocess);
char *dbchange(DBPROCESS * dbprocess);

//DBBOOL dbcharsetconv(DBPROCESS * dbprocess);
DBBOOL dbcharsetconv(DBPROCESS * dbprocess);

//void dbclose(DBPROCESS * dbproc);
void dbclose(DBPROCESS * dbproc);

//void dbclrbuf(DBPROCESS * dbproc, DBINT n);
void dbclrbuf(DBPROCESS * dbproc, DBINT n);

//RETCODE dbclropt(DBPROCESS * dbproc, int option, const char param[]);
RETCODE dbclropt(DBPROCESS * dbproc, int option, const char param[]);

//RETCODE dbcmd(DBPROCESS * dbproc, const char cmdstring[]);
RETCODE dbcmd(DBPROCESS * dbproc, const char cmdstring[]);

//RETCODE dbcmdrow(DBPROCESS * dbproc);
RETCODE dbcmdrow(DBPROCESS * dbproc);

//RETCODE dbtablecolinfo (DBPROCESS *dbproc, DBINT column, DBCOL *pdbcol );
RETCODE dbtablecolinfo (DBPROCESS *dbproc, DBINT column, DBCOL *pdbcol );

//RETCODE dbcolinfo (DBPROCESS *dbproc, CI_TYPE type, DBINT column, DBINT computeid, DBCOL *pdbcol);
RETCODE dbcolinfo (DBPROCESS *dbproc, CI_TYPE type, DBINT column, DBINT computeid, DBCOL *pdbcol);

//DBINT dbcollen(DBPROCESS * dbproc, int column);
DBINT dbcollen(DBPROCESS * dbproc, int column);

//char *dbcolname(DBPROCESS * dbproc, int column);
char *dbcolname(DBPROCESS * dbproc, int column);

//char *dbcolsource(DBPROCESS * dbproc, int colnum);
char *dbcolsource(DBPROCESS * dbproc, int colnum);

//int dbcoltype(DBPROCESS * dbproc, int column);
int dbcoltype(DBPROCESS * dbproc, int column);

//DBTYPEINFO *dbcoltypeinfo(DBPROCESS * dbproc, int column);
DBTYPEINFO *dbcoltypeinfo(DBPROCESS * dbproc, int column);

//DBINT dbcolutype(DBPROCESS * dbprocess, int column);
DBINT dbcolutype(DBPROCESS * dbprocess, int column);

//DBINT dbconvert(DBPROCESS * dbproc, int srctype, const BYTE * src, DBINT srclen, int desttype, BYTE * dest, DBINT destlen);
DBINT dbconvert(DBPROCESS * dbproc, int srctype, const BYTE * src, DBINT srclen, int desttype, BYTE * dest, DBINT destlen);

//DBINT dbconvert_ps(DBPROCESS * dbprocess, int srctype, BYTE * src, DBINT srclen, int desttype, BYTE * dest, DBINT destlen,
//     DBTYPEINFO * typeinfo);
DBINT dbconvert_ps(DBPROCESS * dbprocess, int srctype, BYTE * src, DBINT srclen, int desttype, BYTE * dest, DBINT destlen,
     DBTYPEINFO * typeinfo);

//BOOL dbiscount(DBPROCESS * dbproc);
BOOL dbiscount(DBPROCESS * dbproc);

//DBINT dbcount(DBPROCESS * dbproc);
DBINT dbcount(DBPROCESS * dbproc);

//int dbcurcmd(DBPROCESS * dbproc);
int dbcurcmd(DBPROCESS * dbproc);

//DBINT dbcurrow(DBPROCESS * dbproc);
DBINT dbcurrow(DBPROCESS * dbproc);

//BYTE *dbdata(DBPROCESS * dbproc, int column);
BYTE *dbdata(DBPROCESS * dbproc, int column);

//RETCODE dbdatecmp(DBPROCESS * dbproc, DBDATETIME * d1, DBDATETIME * d2);
RETCODE dbdatecmp(DBPROCESS * dbproc, DBDATETIME * d1, DBDATETIME * d2);

//RETCODE dbdatecrack(DBPROCESS * dbproc, DBDATEREC * di, DBDATETIME * dt);
RETCODE dbdatecrack(DBPROCESS * dbproc, DBDATEREC * di, DBDATETIME * dt);

//DBINT dbdatlen(DBPROCESS * dbproc, int column);
DBINT dbdatlen(DBPROCESS * dbproc, int column);

//DBBOOL dbdead(DBPROCESS * dbproc);
DBBOOL dbdead(DBPROCESS * dbproc);

//EHANDLEFUNC dberrhandle(EHANDLEFUNC handler);
EHANDLEFUNC dberrhandle(EHANDLEFUNC handler);

//void dbexit(void);
void dbexit(void);

//RETCODE dbfcmd(DBPROCESS * dbproc, const char *fmt, ...);
RETCODE dbfcmd(DBPROCESS * dbproc, const char *fmt, ...);

//DBINT dbfirstrow(DBPROCESS * dbproc);
DBINT dbfirstrow(DBPROCESS * dbproc);

//void dbfreebuf(DBPROCESS * dbproc);
void dbfreebuf(DBPROCESS * dbproc);

//char *dbgetchar(DBPROCESS * dbprocess, int n);
char *dbgetchar(DBPROCESS * dbprocess, int n);

//char *dbgetcharset(DBPROCESS * dbprocess);
char *dbgetcharset(DBPROCESS * dbprocess);

//int dbgetlusername(LOGINREC * login, BYTE * name_buffer, int buffer_len);
int dbgetlusername(LOGINREC * login, BYTE * name_buffer, int buffer_len);

//int dbgetmaxprocs(void);
int dbgetmaxprocs(void);

//char *dbgetnatlanf(DBPROCESS * dbprocess);
char *dbgetnatlanf(DBPROCESS * dbprocess);

//int dbgetpacket(DBPROCESS * dbproc);
int dbgetpacket(DBPROCESS * dbproc);

//RETCODE dbgetrow(DBPROCESS * dbproc, DBINT row);
RETCODE dbgetrow(DBPROCESS * dbproc, DBINT row);

//int dbgettime(void);
int dbgettime(void);

//BYTE *dbgetuserdata(DBPROCESS * dbproc);
BYTE *dbgetuserdata(DBPROCESS * dbproc);

//DBBOOL dbhasretstat(DBPROCESS * dbproc);
DBBOOL dbhasretstat(DBPROCESS * dbproc);

//RETCODE dbinit(void);
RETCODE dbinit(void);

//int dbiordesc(DBPROCESS * dbproc);
int dbiordesc(DBPROCESS * dbproc);

//int dbiowdesc(DBPROCESS * dbproc);
int dbiowdesc(DBPROCESS * dbproc);

//DBBOOL dbisavail(DBPROCESS * dbprocess);
DBBOOL dbisavail(DBPROCESS * dbprocess);

//DBBOOL dbisopt(DBPROCESS * dbproc, int option, const char param[]);
DBBOOL dbisopt(DBPROCESS * dbproc, int option, const char param[]);

//DBINT dblastrow(DBPROCESS * dbproc);
DBINT dblastrow(DBPROCESS * dbproc);

//LOGINREC *dblogin(void);
LOGINREC *dblogin(void);

//void dbloginfree(LOGINREC * login);
void dbloginfree(LOGINREC * login);

//int dbmny4cmp(DBPROCESS * dbproc, DBMONEY4 * m1, DBMONEY4 * m2);
int dbmny4cmp(DBPROCESS * dbproc, DBMONEY4 * m1, DBMONEY4 * m2);

//int dbmnycmp(DBPROCESS * dbproc, DBMONEY * m1, DBMONEY * m2);
int dbmnycmp(DBPROCESS * dbproc, DBMONEY * m1, DBMONEY * m2);

//RETCODE dbmny4add(DBPROCESS * dbproc, DBMONEY4 * m1, DBMONEY4 * m2, DBMONEY4 * sum);
RETCODE dbmny4add(DBPROCESS * dbproc, DBMONEY4 * m1, DBMONEY4 * m2, DBMONEY4 * sum);

//RETCODE dbmnydec(DBPROCESS * dbproc, DBMONEY * mnyptr);
RETCODE dbmnydec(DBPROCESS * dbproc, DBMONEY * mnyptr);

//RETCODE dbmnyinc(DBPROCESS * dbproc, DBMONEY * mnyptr);
RETCODE dbmnyinc(DBPROCESS * dbproc, DBMONEY * mnyptr);

//RETCODE dbmnymaxpos(DBPROCESS * dbproc, DBMONEY * dest);
RETCODE dbmnymaxpos(DBPROCESS * dbproc, DBMONEY * dest);

//RETCODE dbmnymaxneg(DBPROCESS * dbproc, DBMONEY * dest);
RETCODE dbmnymaxneg(DBPROCESS * dbproc, DBMONEY * dest);

//RETCODE dbmny4minus(DBPROCESS * dbproc, DBMONEY4 * src, DBMONEY4 * dest);
RETCODE dbmny4minus(DBPROCESS * dbproc, DBMONEY4 * src, DBMONEY4 * dest);

//RETCODE dbmnyminus(DBPROCESS * dbproc, DBMONEY * src, DBMONEY * dest);
RETCODE dbmnyminus(DBPROCESS * dbproc, DBMONEY * src, DBMONEY * dest);

//RETCODE dbmny4sub(DBPROCESS * dbproc, DBMONEY4 * m1, DBMONEY4 * m2, DBMONEY4 * diff);
RETCODE dbmny4sub(DBPROCESS * dbproc, DBMONEY4 * m1, DBMONEY4 * m2, DBMONEY4 * diff);

//RETCODE dbmnysub(DBPROCESS * dbproc, DBMONEY * m1, DBMONEY * m2, DBMONEY * diff);
RETCODE dbmnysub(DBPROCESS * dbproc, DBMONEY * m1, DBMONEY * m2, DBMONEY * diff);

//RETCODE dbmny4copy(DBPROCESS * dbprocess, DBMONEY4 * m1, DBMONEY4 * m2);
RETCODE dbmny4copy(DBPROCESS * dbprocess, DBMONEY4 * m1, DBMONEY4 * m2);

//RETCODE dbmnycopy(DBPROCESS * dbproc, DBMONEY * src, DBMONEY * dest);
RETCODE dbmnycopy(DBPROCESS * dbproc, DBMONEY * src, DBMONEY * dest);

//RETCODE dbmny4zero(DBPROCESS * dbproc, DBMONEY4 * dest);
RETCODE dbmny4zero(DBPROCESS * dbproc, DBMONEY4 * dest);

//RETCODE dbmnyzero(DBPROCESS * dbproc, DBMONEY * dest);
RETCODE dbmnyzero(DBPROCESS * dbproc, DBMONEY * dest);

//const char *dbmonthname(DBPROCESS * dbproc, char *language, int monthnum, DBBOOL shortform);
const char *dbmonthname(DBPROCESS * dbproc, char *language, int monthnum, DBBOOL shortform);

//RETCODE dbmorecmds(DBPROCESS * dbproc);
RETCODE dbmorecmds(DBPROCESS * dbproc);

//RETCODE dbmoretext(DBPROCESS * dbproc, DBINT size, const BYTE text[]);
RETCODE dbmoretext(DBPROCESS * dbproc, DBINT size, const BYTE text[]);

//MHANDLEFUNC dbmsghandle(MHANDLEFUNC handler);
MHANDLEFUNC dbmsghandle(MHANDLEFUNC handler);

//char *dbname(DBPROCESS * dbproc);
char *dbname(DBPROCESS * dbproc);

//RETCODE dbnextrow(DBPROCESS * dbproc);
RETCODE dbnextrow(DBPROCESS * dbproc);

//RETCODE dbnullbind(DBPROCESS * dbproc, int column, DBINT * indicator);
RETCODE dbnullbind(DBPROCESS * dbproc, int column, DBINT * indicator);

//int dbnumalts(DBPROCESS * dbproc, int computeid);
int dbnumalts(DBPROCESS * dbproc, int computeid);

//int dbnumcols(DBPROCESS * dbproc);
int dbnumcols(DBPROCESS * dbproc);

//int dbnumcompute(DBPROCESS * dbprocess);
int dbnumcompute(DBPROCESS * dbprocess);

//int dbnumrets(DBPROCESS * dbproc);
int dbnumrets(DBPROCESS * dbproc);

//DBPROCESS *tdsdbopen(LOGINREC * login, const char *server, int msdblib);
DBPROCESS *tdsdbopen(LOGINREC * login, const char *server, int msdblib);

//DBPROCESS *dbopen(LOGINREC * login, const char *server);
DBPROCESS *dbopen(LOGINREC * login, const char *server);

//void dbprhead(DBPROCESS * dbproc);
void dbprhead(DBPROCESS * dbproc);

//RETCODE dbprrow(DBPROCESS * dbproc);
RETCODE dbprrow(DBPROCESS * dbproc);

//const char *dbprtype(int token);
const char *dbprtype(int token);

//DBBOOL DRBUF(DBPROCESS * dbprocess);
DBBOOL DRBUF(DBPROCESS * dbprocess);

//STATUS dbreadtext(DBPROCESS * dbproc, void *buf, DBINT bufsize);
STATUS dbreadtext(DBPROCESS * dbproc, void *buf, DBINT bufsize);

//void dbrecftos(const char filename[]);
void dbrecftos(const char filename[]);

//RETCODE dbresults(DBPROCESS * dbproc);
RETCODE dbresults(DBPROCESS * dbproc);

//RETCODE dbresults_r(DBPROCESS * dbproc, int recursive);
RETCODE dbresults_r(DBPROCESS * dbproc, int recursive);

//BYTE *dbretdata(DBPROCESS * dbproc, int retnum);
BYTE *dbretdata(DBPROCESS * dbproc, int retnum);

//int dbretlen(DBPROCESS * dbproc, int retnum);
int dbretlen(DBPROCESS * dbproc, int retnum);

//char *dbretname(DBPROCESS * dbproc, int retnum);
char *dbretname(DBPROCESS * dbproc, int retnum);

//DBINT dbretstatus(DBPROCESS * dbproc);
DBINT dbretstatus(DBPROCESS * dbproc);

//int dbrettype(DBPROCESS * dbproc, int retnum);
int dbrettype(DBPROCESS * dbproc, int retnum);

//RETCODE dbrows(DBPROCESS * dbproc);
RETCODE dbrows(DBPROCESS * dbproc);

//STATUS dbrowtype(DBPROCESS * dbprocess);
STATUS dbrowtype(DBPROCESS * dbprocess);

//RETCODE dbrpcinit(DBPROCESS * dbproc, const char rpcname[], DBSMALLINT options);
RETCODE dbrpcinit(DBPROCESS * dbproc, const char rpcname[], DBSMALLINT options);

//RETCODE dbrpcparam(DBPROCESS * dbproc, const char paramname[], BYTE status, int type, DBINT maxlen, DBINT datalen, BYTE * value);
RETCODE dbrpcparam(DBPROCESS * dbproc, const char paramname[], BYTE status, int type, DBINT maxlen, DBINT datalen, BYTE * value);

//RETCODE dbrpcsend(DBPROCESS * dbproc);
RETCODE dbrpcsend(DBPROCESS * dbproc);

//RETCODE dbsafestr(DBPROCESS * dbproc, const char *src, DBINT srclen, char *dest, DBINT destlen, int quotetype);
RETCODE dbsafestr(DBPROCESS * dbproc, const char *src, DBINT srclen, char *dest, DBINT destlen, int quotetype);

//RETCODE *dbsechandle(DBINT type, INTFUNCPTR handler);
RETCODE *dbsechandle(DBINT type, INTFUNCPTR handler);

//char *dbservcharset(DBPROCESS * dbprocess);
char *dbservcharset(DBPROCESS * dbprocess);

//void dbsetavail(DBPROCESS * dbprocess);
void dbsetavail(DBPROCESS * dbprocess);

//void dbsetbusy(DBPROCESS * dbprocess, DB_DBBUSY_FUNC busyfunc);
void dbsetbusy(DBPROCESS * dbprocess, DB_DBBUSY_FUNC busyfunc);

//RETCODE dbsetdefcharset(char *charset);
RETCODE dbsetdefcharset(char *charset);

//void dbsetidle(DBPROCESS * dbprocess, DB_DBIDLE_FUNC idlefunc);
void dbsetidle(DBPROCESS * dbprocess, DB_DBIDLE_FUNC idlefunc);

//void dbsetifile(char *filename);
void dbsetifile(char *filename);

//void dbsetinterrupt(DBPROCESS * dbproc, DB_DBCHKINTR_FUNC chkintr, DB_DBHNDLINTR_FUNC hndlintr);
void dbsetinterrupt(DBPROCESS * dbproc, DB_DBCHKINTR_FUNC chkintr, DB_DBHNDLINTR_FUNC hndlintr);

//RETCODE dbsetlogintime(int seconds);
RETCODE dbsetlogintime(int seconds);

//RETCODE dbsetmaxprocs(int maxprocs);
RETCODE dbsetmaxprocs(int maxprocs);

//RETCODE dbsetnull(DBPROCESS * dbprocess, int bindtype, int bindlen, BYTE * bindval);

//RETCODE dbsetopt(DBPROCESS * dbproc, int option, const char *char_param, int int_param);

//STATUS dbsetrow(DBPROCESS * dbprocess, DBINT row);

//RETCODE dbsettime(int seconds);

//void dbsetuserdata(DBPROCESS * dbproc, BYTE * ptr);

//RETCODE dbsetversion(DBINT version);

//int dbspid(DBPROCESS * dbproc);

//RETCODE dbspr1row(DBPROCESS * dbproc, char *buffer, DBINT buf_len);

//DBINT dbspr1rowlen(DBPROCESS * dbproc);

//RETCODE dbsprhead(DBPROCESS * dbproc, char *buffer, DBINT buf_len);

//RETCODE dbsprline(DBPROCESS * dbproc, char *buffer, DBINT buf_len, DBCHAR line_char);

//RETCODE dbsqlexec(DBPROCESS * dbproc);

//RETCODE dbsqlok(DBPROCESS * dbproc);

//RETCODE dbsqlsend(DBPROCESS * dbproc);

//int dbstrbuild(DBPROCESS * dbproc, char *charbuf, int bufsize, char *text, char *formats, ...);

//RETCODE dbstrcpy(DBPROCESS * dbproc, int start, int numbytes, char *dest);

//int dbstrlen(DBPROCESS * dbproc);

//DBINT dbvarylen(DBPROCESS * dbproc, int column);

//int dbtds(DBPROCESS * dbprocess);

//DBINT dbtextsize(DBPROCESS * dbprocess);
//DBBINARY *dbtxptr(DBPROCESS * dbproc, int column);
//DBBINARY *dbtxtimestamp(DBPROCESS * dbproc, int column);
//DBBINARY *dbtxtsnewval(DBPROCESS * dbprocess);
//RETCODE dbtxtsput(DBPROCESS * dbprocess, DBBINARY newtxts, int colnum);
//RETCODE dbuse(DBPROCESS * dbproc, const char *name);
//const char *dbversion(void);
//DBBOOL dbwillconvert(int srctype, int desttype);
//RETCODE dbwritetext(DBPROCESS * dbproc, char *objname, DBBINARY * textptr, DBTINYINT textptrlen, DBBINARY * timestamp,
//      DBBOOL log, DBINT size, BYTE * text);
//RETCODE dbsetlname(LOGINREC * login, const char *value, int which);
//RETCODE dbsetlbool(LOGINREC * login, int value, int which);
//RETCODE dbsetllong(LOGINREC * login, long value, int which);
//RETCODE dbsetlversion (LOGINREC * login, BYTE version);
//RETCODE bcp_init(DBPROCESS * dbproc, const char *tblname, const char *hfile, const char *errfile, int direction);
//RETCODE bcp_done(DBPROCESS * dbproc);
//RETCODE bcp_batch(DBPROCESS * dbproc);
//RETCODE bcp_bind(DBPROCESS * dbproc, BYTE * varaddr, int prefixlen, DBINT varlen, BYTE * terminator, int termlen, int type,
//   int table_column);
//RETCODE bcp_collen(DBPROCESS * dbproc, DBINT varlen, int table_column);
//RETCODE bcp_columns(DBPROCESS * dbproc, int host_colcount);
//RETCODE bcp_colfmt(DBPROCESS * dbproc, int host_column, int host_type, int host_prefixlen, DBINT host_collen,
//     const BYTE * host_term, int host_termlen, int colnum);
//RETCODE bcp_colfmt_ps(DBPROCESS * dbproc, int host_column, int host_type, int host_prefixlen, DBINT host_collen,
//        BYTE * host_term, int host_termlen, int colnum, DBTYPEINFO * typeinfo);
//RETCODE bcp_colptr(DBPROCESS * dbproc, BYTE * colptr, int table_column);
//RETCODE bcp_control(DBPROCESS * dbproc, int field, DBINT value);
//int bcp_getbatchsize(DBPROCESS * dbproc);
//RETCODE bcp_exec(DBPROCESS * dbproc, DBINT * rows_copied);
//DBBOOL bcp_getl(LOGINREC * login);
//RETCODE bcp_options(DBPROCESS * dbproc, int option, BYTE * value, int valuelen);
//RETCODE bcp_readfmt(DBPROCESS * dbproc, const char filename[]);
//RETCODE bcp_sendrow(DBPROCESS * dbproc);
