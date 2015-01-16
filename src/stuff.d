//#include <unistd.h>
//#include <sys/param.h>
//#include <sybfront.h>
//#include <sybdb.h>
//#include <syberror.h>
//#include <stdio.h>
//
//#define  UID       "yourlogin"
//#define  PWD       "yourpassword"
//#define  PROGNAME  "DemoProg"
//#define  DBSERVER  "192.168.1.10"
//#define  DBNAME    "DatabaseName"
//
//int main(void) {
//  LOGINREC *login;
//  DBPROCESS *dbconn;
//  char hostname[MAXHOSTNAMELEN];
//  int max_len = MAXHOSTNAMELEN;
//  DBINT customer_id;
//  DBCHAR company_name[255];
//  DBFLT8 avg_income;
//
//  /* Init the DB library */
//  if (dbinit() == FAIL) {
//    fprintf(stderr, "Could not init db.\n");
//    return 1;
//  }
//
//  /* Allocate a login params structure */
//  if ((login = dblogin()) == FAIL) {
//    fprintf(stderr, "Could not initialize dblogin() structure.\n");
//    return 2;
//  }
//
//  /* Initialize the login params in the structure */
//  DBSETLUSER(login, UID);
//  DBSETLPWD(login, PWD);
//  DBSETLAPP(login, PROGNAME);
//  if (gethostname(hostname, max_len) == 0)
//    DBSETLHOST(login, hostname);
//
//  /* Now connect to the DB Server */
//  if ((dbconn = dbopen(login, DBSERVER)) == NULL) {
//    fprintf(stderr, "Could not connect to DB Server: %s\n", DBSERVER);
//    return 3;
//  }
//
//  /* Now switch to the correct database */
//  if ((dbuse(dbconn, DBNAME)) == FAIL) {
//    fprintf(stderr, "Could not switch to database %s on DB Server %s\n", DBNAME, DBSERVER);
//    return 4;
//  }
//
//  /* You can free the login structure now, as it is no longer needed after logging in */
//  dbloginfree(login);
//
//  /* Now prepare a SQL statement */
//  dbcmd(dbconn, "SELECT id, company_name, avg_income FROM Customer WITH (NOLOCK)");
//  /* Can use dbfcmd instead, if you want to format the SQL
//     E.g.
//     dbfcmd(dbconn, "SELECT id FROM Customer WHERE company_name='%s' AND avg_income > %f",
//            company_name, avg_income);
//  */
//
//  /* Now execute the SQL statement */
//  if (dbsqlexec(dbconn) == FAIL) {
//    fprintf(stderr, "Could not execute the sql statement\n");
//    return 5;
//  }
//  dbresults(dbconn); /* Very important to call this! :) */
//
//  /* Now bind the returned columns to the variables */
//  dbbind(dbconn, 1, INTBIND, 0, (BYTE *)&customer_id);
//  dbbind(dbconn, 2, NTBSTRINGBIND, 0, (BYTE *)&company_name);
//  dbbind(dbconn, 3, FLT8BIND, 0, (BYTE*)&avg_income);
//
//  /* Loop thru the result set */
//  while (dbnextrow(dbconn) != NO_MORE_ROWS) {
//    /* print out the data */
//    printf("%d %s %f\n", customer_id, company_name, avg_income);
//  }
//
//  /* Clean up*/
//  dbfreebuf(dbconn);
//  dbclose(dbconn);
//  dbexit();
//
//  return 0;
//}