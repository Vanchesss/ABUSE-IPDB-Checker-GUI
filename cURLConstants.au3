#include-once

; #INDEX# =======================================================================================================================
; Title .........: cURL_Constants
; AutoIt Version : 3.3.12.0
; Language ......: English
; Description ...: Constants to be included in an AutoIt v3 script when using cURL functions.
; Author(s) .....: BIOS
; ===============================================================================================================================

; #CONSTANTS# ===================================================================================================================
Global Const $cURL_OPT_WRITEDATA = 10000 + 1 ; STRING
Global Const $cURL_OPT_URL = 10000 + 2 ; STRING ;  The full URL to get/put
Global Const $cURL_OPT_PORT = 3 ; LONG ;  Port number to connect to, if other than default.
Global Const $cURL_OPT_PROXY = 10000 + 4 ; STRING ;  Name of proxy to use.
Global Const $cURL_OPT_USERPWD = 10000 + 5 ; STRING ;  "user:password;options" to use when fetching.
Global Const $cURL_OPT_PROXYUSERPWD = 10000 + 6 ; STRING ;  "user:password" to use with proxy.
Global Const $cURL_OPT_RANGE = 10000 + 7 ; STRING ;  Range to get, specified as an ASCII string.
Global Const $cURL_OPT_READDATA = 10000 + 9 ; STRING ;  Specified file stream to upload from (use as input):
Global Const $cURL_OPT_ERRORBUFFER = 10000 + 10 ; STRING ;  Buffer to receive error messages in, must be at least CURL_ERROR_SIZE bytes big. If this is not used, error messages go to stderr instead:
;Global Const $cURL_OPT_WRITEFUNCTION = 11 ; CallBack ;  Function that will be called to store the output (instead of fwrite). The parameters will use fwrite() syntax, make sure to follow them.
;Global Const $cURL_OPT_READFUNCTION = 12 ; CallBack ;  Function that will be called to read the input (instead of fread). The parameters will use fread() syntax, make sure to follow them.
Global Const $cURL_OPT_TIMEOUT = 13 ; LONG ;  Time-out the read operation after this amount of seconds
Global Const $cURL_OPT_INFILESIZE = 14 ; LONG ;  If the CURLOPT_INFILE is used, this can be used to inform libcurl about how large the file being sent really is. That allows better error checking and better verifies that the upload was successful. -1 means unknown size. For large file support, there is also a _LARGE version of the key which takes an off_t type, allowing platforms with larger off_t sizes to handle larger files.  See below for INFILESIZE_LARGE.
Global Const $cURL_OPT_POSTFIELDS = 10000 + 15 ; STRING ;  POST static input fields.
Global Const $cURL_OPT_REFERER = 10000 + 16 ; STRING ;  Set the referrer page (needed by some CGIs)
Global Const $cURL_OPT_FTPPORT = 10000 + 17 ; STRING ;  Set the FTP PORT string (interface name, named or numerical IP address) Use i.e '-' to use default address.
Global Const $cURL_OPT_USERAGENT = 10000 + 18 ; STRING ;  Set the User-Agent string (examined by some CGIs)

;  If the download receives less than "low speed limit" bytes/second during "low speed time" seconds, the operations is aborted. You could i.e if you have a pretty high speed connection, abort if it is less than 2000 bytes/sec during 20 seconds.
Global Const $cURL_OPT_LOW_SPEED_LIMIT = 19 ; LONG ;  Set the "low speed limit"
Global Const $cURL_OPT_LOW_SPEED_TIME = 20 ; LONG ;  Set the "low speed time"

Global Const $cURL_OPT_RESUME_FROM = 21 ; LONG ;  Set the continuation offset. Note there is also a _LARGE version of this key which uses off_t types, allowing for large file offsets on platforms which use larger-than-32-bit off_t's.  Look below for RESUME_FROM_LARGE.
Global Const $cURL_OPT_COOKIE = 10000 + 22 ; STRING ;  Set cookie in request:
Global Const $cURL_OPT_HTTPHEADER = 10000 + 23 ; STRING ;  This points to a linked list of headers, struct curl_slist kind. This list is also used for RTSP (in spite of its name)
Global Const $cURL_OPT_HTTPPOST = 10000 + 24 ; STRING ;  This points to a linked list of post entries, struct curl_httppost
Global Const $cURL_OPT_SSLCERT = 10000 + 25 ; STRING ;  name of the file keeping your private SSL-certificate
Global Const $cURL_OPT_KEYPASSWD = 10000 + 26 ; STRING ;  password for the SSL or SSH private key
Global Const $cURL_OPT_CRLF = 27 ; LONG ;  send TYPE parameter?
Global Const $cURL_OPT_QUOTE = 10000 + 28 ; STRING ;  send linked-list of QUOTE commands
Global Const $cURL_OPT_HEADERDATA = 10000 + 29 ; STRING ;  send FILE * or void * to store headers to, if you use a callback it is simply passed to the callback unmodified
Global Const $cURL_OPT_COOKIEFILE = 10000 + 31 ; STRING ;  point to a file to read the initial cookies from, also enables "cookie awareness"
Global Const $cURL_OPT_SSLVERSION = 32 ; LONG ;  What version to specifically try to use. See CURL_SSLVERSION defines below.
Global Const $cURL_OPT_TIMECONDITION = 33 ; LONG ;  What kind of HTTP time condition to use, see defines
Global Const $cURL_OPT_TIMEVALUE = 34 ; LONG ;  Time to use with the above condition. Specified in number of seconds since 1 Jan 1970

;  Custom request, for customizing the get command like
;   HTTP: DELETE, TRACE and others
;   FTP: to use a different list command
Global Const $cURL_OPT_CUSTOMREQUEST = 10000 + 36 ; STRING

Global Const $cURL_OPT_STDERR = 10000 + 37 ; STRING ;  HTTP request, for odd commands like DELETE, TRACE and others
Global Const $cURL_OPT_POSTQUOTE = 10000 + 39 ; STRING ;  send linked-list of post-transfer QUOTE commands

Global Const $cURL_OPT_VERBOSE = 41 ; LONG      ;  talk a lot
Global Const $cURL_OPT_HEADER = 42 ; LONG       ;  throw the header out too
Global Const $cURL_OPT_NOPROGRESS = 43 ; LONG   ;  shut off the progress meter
Global Const $cURL_OPT_NOBODY = 44 ; LONG       ;  use HEAD to get http document
Global Const $cURL_OPT_FAILONERROR = 45 ; LONG  ;  no output on http error codes >= 400
Global Const $cURL_OPT_UPLOAD = 46 ; LONG       ;  this is an upload
Global Const $cURL_OPT_POST = 47 ; LONG         ;  HTTP POST method
Global Const $cURL_OPT_DIRLISTONLY = 48 ; LONG  ;  bare names when listing directories

Global Const $cURL_OPT_APPEND = 50 ; LONG       ;  Append instead of overwrite on upload!
Global Const $cURL_OPT_NETRC = 51 ; LONG ;  Specify whether to read the user+password from the .netrc or the URL. This must be one of the $cURL_NETRC_* enums below.
Global Const $cURL_OPT_FOLLOWLOCATION = 52 ; LONG  ;  use Location: Luke!
Global Const $cURL_OPT_TRANSFERTEXT = 53 ; LONG ;  transfer data in text/ASCII format
Global Const $cURL_OPT_PUT = 54 ; LONG          ;  HTTP PUT
;Global Const $cURL_OPT_PROGRESSFUNCTION = 56 ; CallBack ;  DEPRECATED Function that will be called instead of the internal progress display function. This function should be defined as the curl_progress_callback prototype defines.
Global Const $cURL_OPT_PROGRESSDATA = 10000 + 57 ; STRING ;  Data passed to the CURLOPT_PROGRESSFUNCTION and CURLOPT_XFERINFOFUNCTION callbacks
Global Const $cURL_OPT_AUTOREFERER = 58 ; LONG ;  We want the referrer field set automatically when following locations
Global Const $cURL_OPT_PROXYPORT = 59 ; LONG ;  Port of the proxy, can be set in the proxy string as well with: "[host]:[port]"
Global Const $cURL_OPT_POSTFIELDSIZE = 60 ; LONG ;  size of the POST input data, if strlen() is not good to use
Global Const $cURL_OPT_HTTPPROXYTUNNEL = 61 ; LONG ;  tunnel non-http operations through a HTTP proxy
Global Const $cURL_OPT_INTERFACE = 10000 + 62 ; STRING ;  Set the interface string to use as outgoing network interface
Global Const $cURL_OPT_KRBLEVEL = 10000 + 63 ; STRING ;  Set the krb4/5 security level, this also enables krb4/5 awareness. This is a string, 'clear', 'safe', 'confidential' or 'private'.  If the string is set but doesn't match one of these, 'private' will be used.
Global Const $cURL_OPT_SSL_VERIFYPEER = 64 ; LONG ;  Set if we should verify the peer in ssl handshake, set 1 to verify.
Global Const $cURL_OPT_CAINFO = 10000 + 65 ; STRING ;  The CApath or CAfile used to validate the peer certificate this option is used only if SSL_VERIFYPEER is true
Global Const $cURL_OPT_MAXREDIRS = 68 ; LONG ;  Maximum number of http redirects to follow
Global Const $cURL_OPT_FILETIME = 69 ; LONG ;  Pass a long set to 1 to get the date of the requested document (if possible)! Pass a zero to shut it off.
Global Const $cURL_OPT_TELNETOPTIONS = 10000 + 70 ; STRING ;  This points to a linked list of telnet options
Global Const $cURL_OPT_MAXCONNECTS = 71 ; LONG ;  Max amount of cached alive connections
Global Const $cURL_OPT_FRESH_CONNECT = 74 ; LONG ;  Set to explicitly use a new connection for the upcoming transfer. Do not use this unless you're absolutely sure of this, as it makes the operation slower and is less friendly for the network.
Global Const $cURL_OPT_FORBID_REUSE = 75 ; LONG ;  Set to explicitly forbid the upcoming transfer's connection to be re-used when done. Do not use this unless you're absolutely sure of this, as it makes the operation slower and is less friendly for the network.
Global Const $cURL_OPT_RANDOM_FILE = 10000 + 76 ; STRING ;  Set to a file name that contains random data for libcurl to use to seed the random engine when doing SSL connects.
Global Const $cURL_OPT_EGDSOCKET = 10000 + 77 ; STRING ;  Set to the Entropy Gathering Daemon socket pathname
Global Const $cURL_OPT_CONNECTTIMEOUT = 78 ; LONG ;  Time-out connect operations after this amount of seconds, if connects are OK within this time, then fine... This only aborts the connect phase.
;Global Const $cURL_OPT_HEADERFUNCTION = 79 ; CallBack ;  Function that will be called to store headers (instead of fwrite). The parameters will use fwrite() syntax, make sure to follow them.
Global Const $cURL_OPT_HTTPGET = 80 ; LONG ;  Set this to force the HTTP request to get back to GET. Only really usable if POST, PUT or a custom request have been used first.
Global Const $cURL_OPT_SSL_VERIFYHOST = 81 ; LONG ;  Set if we should verify the Common name from the peer certificate in ssl handshake, set 1 to check existence, 2 to ensure that it matches the provided hostname.
Global Const $cURL_OPT_COOKIEJAR = 10000 + 82 ; STRING ;  Specify which file name to write all known cookies in after completed operation. Set file name to "-" (dash) to make it go to stdout.
Global Const $cURL_OPT_SSL_CIPHER_LIST = 10000 + 83 ; STRING ;  Specify which SSL ciphers to use
Global Const $cURL_OPT_HTTP_VERSION = 84 ; LONG ;  Specify which HTTP version to use! This must be set to one of the $cURL_HTTP_VERSION* enums set below.
Global Const $cURL_OPT_FTP_USE_EPSV = 85 ; LONG ;  Specifically switch on or off the FTP engine's use of the EPSV command. By default, that one will always be attempted before the more traditional PASV command.
Global Const $cURL_OPT_SSLCERTTYPE = 10000 + 86 ; STRING ;  type of the file keeping your SSL-certificate ("DER", "PEM", "ENG")
Global Const $cURL_OPT_SSLKEY = 10000 + 87 ; STRING ;  name of the file keeping your private SSL-key
Global Const $cURL_OPT_SSLKEYTYPE = 10000 + 88 ; STRING ;  type of the file keeping your private SSL-key ("DER", "PEM", "ENG")
Global Const $cURL_OPT_SSLENGINE = 10000 + 89 ; STRING ;  crypto engine for the SSL-sub system
Global Const $cURL_OPT_SSLENGINE_DEFAULT = 90 ; LONG ;  set the crypto engine for the SSL-sub system as default the param has no meaning...
;Global Const $cURL_OPT_DNS_USE_GLOBAL_CACHE = 91 ; LONG ;  DEPRECATED, do not use! ;  Non-zero value means to use the global dns cache
Global Const $cURL_OPT_DNS_CACHE_TIMEOUT = 92 ; LONG ;  DNS cache timeout
Global Const $cURL_OPT_PREQUOTE = 10000 + 93 ; STRING ;  send linked-list of pre-transfer QUOTE commands
;Global Const $cURL_OPT_DEBUGFUNCTION = 94 ; CallBack ;  set the debug function
Global Const $cURL_OPT_DEBUGDATA = 10000 + 95 ; STRING ;  set the data for the debug function
Global Const $cURL_OPT_COOKIESESSION = 96 ; LONG ;  mark this as start of a cookie session
Global Const $cURL_OPT_CAPATH = 10000 + 97 ; STRING ;  The CApath directory used to validate the peer certificate this option is used only if SSL_VERIFYPEER is true
Global Const $cURL_OPT_BUFFERSIZE = 98 ; LONG ;  Instruct libcurl to use a smaller receive buffer
Global Const $cURL_OPT_NOSIGNAL = 99 ; LONG ;  Instruct libcurl to not use any signal/alarm handlers, even when using timeouts. This option is useful for multi-threaded applications. See libcurl-the-guide for more background information.
Global Const $cURL_OPT_SHARE = 10000 + 100 ; STRING ;  Provide a CURLShare for mutexing non-ts data
Global Const $cURL_OPT_PROXYTYPE = 101 ; LONG;  indicates type of proxy. accepted values are CURLPROXY_HTTP (default ; STRING CURLPROXY_SOCKS4, CURLPROXY_SOCKS4A and CURLPROXY_SOCKS5.
Global Const $cURL_OPT_ACCEPT_ENCODING = 10000 + 102 ; STRING ;  Set the Accept-Encoding string. Use this to tell a server you would like the response to be compressed. Before 7.21.6, this was known as CURLOPT_ENCODING
Global Const $cURL_OPT_PRIVATE = 10000 + 103 ; STRING ;  Set pointer to private data
Global Const $cURL_OPT_HTTP200ALIASES = 10000 + 104 ; STRING ;  Set aliases for HTTP 200 in the HTTP Response header
Global Const $cURL_OPT_UNRESTRICTED_AUTH = 105 ; LONG ;  Continue to send authentication (user+password) when following locations, even when hostname changed. This can potentially send off the name and password to whatever host the server decides.
Global Const $cURL_OPT_FTP_USE_EPRT = 106 ; LONG ;  Specifically switch on or off the FTP engine's use of the EPRT command (it also disables the LPRT attempt). By default, those ones will always be attempted before the good old traditional PORT command.
Global Const $cURL_OPT_HTTPAUTH = 107 ; LONG ;  Set this to a bitmask value to enable the particular authentications methods you like. Use this in combination with CURLOPT_USERPWD. Note that setting multiple bits may cause extra network round-trips.
;Global Const $cURL_OPT_SSL_CTX_FUNCTION = 108 ; CallBack ;  Set the ssl context callback function, currently only for OpenSSL ssl_ctx in second argument. The function must be matching the curl_ssl_ctx_callback proto.
Global Const $cURL_OPT_SSL_CTX_DATA = 10000 + 109 ; STRING ;  Set the userdata for the ssl context callback function's third argument
Global Const $cURL_OPT_FTP_CREATE_MISSING_DIRS = 110 ; LONG ;  FTP Option that causes missing dirs to be created on the remote server. In 7.19.4 we introduced the convenience enums for this option using the CURLFTP_CREATE_DIR prefix.
Global Const $cURL_OPT_PROXYAUTH = 111 ; LONG ;  Set this to a bitmask value to enable the particular authentications methods you like. Use this in combination with CURLOPT_PROXYUSERPWD. Note that setting multiple bits may cause extra network round-trips.
Global Const $cURL_OPT_FTP_RESPONSE_TIMEOUT = 112 ; LONG ;  FTP option that changes the timeout, in seconds, associated with getting a response.  This is different from transfer timeout time and essentially places a demand on the FTP server to acknowledge commands in a timely manner.
Global Const $cURL_OPT_IPRESOLVE = 113 ; LONG ;  Set this option to one of the $cURL_IPRESOLVE_* defines (see below) to tell libcurl to resolve names to those IP versions only. This only has affect on systems with support for more than one, i.e IPv4 _and_ IPv6.
Global Const $cURL_OPT_MAXFILESIZE = 114 ; LONG ;  Set this option to limit the size of a file that will be downloaded from an HTTP or FTP server. Note there is also _LARGE version which adds large file support for platforms which have larger off_t sizes.  See MAXFILESIZE_LARGE below.
;Global Const $cURL_OPT_INFILESIZE_LARGE, OFF_T, 115 ; STRING ;  See the comment for INFILESIZE above, but in short, specifies the size of the file being uploaded.  -1 means unknown.
;Global Const $cURL_OPT_RESUME_FROM_LARGE, OFF_T, 116 ; STRING ;  Sets the continuation offset.  There is also a LONG version of this; look above for RESUME_FROM.
;Global Const $cURL_OPT_MAXFILESIZE_LARGE, OFF_T, 117 ; STRING ;  Sets the maximum size of data that will be downloaded from an HTTP or FTP server.  See MAXFILESIZE above for the LONG version.
Global Const $cURL_OPT_NETRC_FILE = 10000 + 118 ; STRING ;  Set this option to the file name of your .netrc file you want libcurl to parse (using the CURLOPT_NETRC option). If not set, libcurl will do a poor attempt to find the user's home directory and check for a .netrc file in there.

;  Enable SSL/TLS for FTP, pick one of:
;   $cURL_USESSL_TRY     - try using SSL, proceed anyway otherwise
;   $cURL_USESSL_CONTROL - SSL for the control connection or fail
;   $cURL_USESSL_ALL     - SSL for all communication or fail
Global Const $cURL_OPT_USE_SSL = 119 ; LONG

;Global Const $cURL_OPT_POSTFIELDSIZE_LARGE, OFF_T, 120 ; STRING ;  The _LARGE version of the standard POSTFIELDSIZE option
Global Const $cURL_OPT_TCP_NODELAY = 121 ; LONG ;  Enable/disable the TCP Nagle algorithm

;  When FTP over SSL/TLS is selected (with CURLOPT_USE_SSL ; STRING this option can be used to change libcurl's default action which is to first try "AUTH SSL" and then "AUTH TLS" in this order, and proceed when a OK response has been received.
;   Available parameters are:
;   CURLFTPAUTH_DEFAULT - let libcurl decide
;   CURLFTPAUTH_SSL     - try "AUTH SSL" first, then TLS
;   CURLFTPAUTH_TLS     - try "AUTH TLS" first, then SSL
Global Const $cURL_OPT_FTPSSLAUTH = 129 ; LONG

;Global Const $cURL_OPT_IOCTLFUNCTION = 130 ; CallBack
Global Const $cURL_OPT_IOCTLDATA = 10000 + 131 ; STRING
Global Const $cURL_OPT_FTP_ACCOUNT = 10000 + 134 ; STRING ;  zero terminated string for pass on to the FTP server when asked for "account" info
Global Const $cURL_OPT_COOKIELIST = 10000 + 135 ; STRING ;  feed cookies into cookie engine
Global Const $cURL_OPT_IGNORE_CONTENT_LENGTH = 136 ; LONG ;  ignore Content-Length
Global Const $cURL_OPT_FTP_SKIP_PASV_IP = 137 ; LONG ;  Set to non-zero to skip the IP address received in a 227 PASV FTP server response. Typically used for FTP-SSL purposes but is not restricted to that. libcurl will then instead use the same IP address it used for the control connection.
Global Const $cURL_OPT_FTP_FILEMETHOD = 138 ; LONG ;  Select "file method" to use when doing FTP, see the curl_ftpmethod above.
Global Const $cURL_OPT_LOCALPORT = 139 ; LONG ;  Local port number to bind the socket to
Global Const $cURL_OPT_LOCALPORTRANGE = 140 ; LONG ;  Number of ports to try, including the first one set with LOCALPORT. Thus, setting it to 1 will make no additional attempts but the first.
Global Const $cURL_OPT_CONNECT_ONLY = 141 ; LONG ;  no transfer, set up connection and let application use the socket by extracting it with CURLINFO_LASTSOCKET
;Global Const $cURL_OPT_CONV_FROM_NETWORK_FUNCTION = 142 ; CallBack ;  Function that will be called to convert from the network encoding (instead of using the iconv calls in libcurl)
;Global Const $cURL_OPT_CONV_TO_NETWORK_FUNCTION = 143 ; CallBack ;  Function that will be called to convert to the network encoding (instead of using the iconv calls in libcurl)
;Global Const $cURL_OPT_CONV_FROM_UTF8_FUNCTION = 144 ; CallBack;  Function that will be called to convert from UTF8 (instead of using the iconv calls in libcurl) Note that this is used only for SSL certificate processing
;Global Const $cURL_OPT_MAX_SEND_SPEED_LARGE, OFF_T, 145 ; STRING ;  if the connection proceeds too quickly then need to slow it down limit-rate: maximum number of bytes per second to send or receive
;Global Const $cURL_OPT_MAX_RECV_SPEED_LARGE, OFF_T, 146 ; STRING ;  if the connection proceeds too quickly then need to slow it down limit-rate: maximum number of bytes per second to send or receive
Global Const $cURL_OPT_FTP_ALTERNATIVE_TO_USER = 10000 + 147 ; STRING ;  Pointer to command string to send if USER/PASS fails.
;Global Const $cURL_OPT_SOCKOPTFUNCTION = 148 ; CallBack ;  callback function for setting socket options
Global Const $cURL_OPT_SOCKOPTDATA = 10000 + 149 ; STRING
Global Const $cURL_OPT_SSL_SESSIONID_CACHE = 150 ; LONG ;  set to 0 to disable session ID re-use for this transfer, default is enabled (== 1)
Global Const $cURL_OPT_SSH_AUTH_TYPES = 151 ; LONG ;  allowed SSH authentication methods
Global Const $cURL_OPT_SSH_PUBLIC_KEYFILE = 10000 + 152 ; STRING ;  Used by scp/sftp to do public/private key authentication
Global Const $cURL_OPT_SSH_PRIVATE_KEYFILE = 10000 + 153 ; STRING ;  Used by scp/sftp to do public/private key authentication
Global Const $cURL_OPT_FTP_SSL_CCC = 154 ; LONG ;  Send CCC (Clear Command Channel) after authentication
Global Const $cURL_OPT_TIMEOUT_MS = 155 ; LONG ;  Same as TIMEOUT, but with ms resolution
Global Const $cURL_OPT_CONNECTTIMEOUT_MS = 156 ; LONG ;  Same as CONNECTTIMEOUT, but with ms resolution
Global Const $cURL_OPT_HTTP_TRANSFER_DECODING = 157 ; LONG ;  set to zero to disable the libcurl's decoding and thus pass the raw body data to the application even when it is encoded/compressed
Global Const $cURL_OPT_HTTP_CONTENT_DECODING = 158 ; LONG ;  set to zero to disable the libcurl's decoding and thus pass the raw body data to the application even when it is encoded/compressed
Global Const $cURL_OPT_NEW_FILE_PERMS = 159 ; LONG ;  Permission used when creating new files and directories on the remote server for protocols that support it, SFTP/SCP/FILE
Global Const $cURL_OPT_NEW_DIRECTORY_PERMS = 160 ; LONG ;  Permission used when creating new files and directories on the remote server for protocols that support it, SFTP/SCP/FILE
Global Const $cURL_OPT_POSTREDIR = 161 ; LONG ;  Set the behaviour of POST when redirecting. Values must be set to one of $cURL_REDIR* defines below. This used to be called CURLOPT_POST301
Global Const $cURL_OPT_SSH_HOST_PUBLIC_KEY_MD5 = 10000 + 162 ; STRING ;  used by scp/sftp to verify the host's public key
;Global Const $cURL_OPT_OPENSOCKETFUNCTION = 163 ; CallBack ;  Callback function for opening socket (instead of socket(2)). Optionally, callback is able change the address or refuse to connect returning CURL_SOCKET_BAD.  The callback should have type curl_opensocket_callback
Global Const $cURL_OPT_OPENSOCKETDATA = 10000 + 164 ; STRING
Global Const $cURL_OPT_COPYPOSTFIELDS = 10000 + 165 ; STRING ;  POST volatile input fields.
Global Const $cURL_OPT_PROXY_TRANSFER_MODE = 166 ; LONG ;  set transfer mode (;type=<a|i>) when doing FTP via an HTTP proxy
;Global Const $cURL_OPT_SEEKFUNCTION = 167 ; CallBack ;  Callback function for seeking in the input stream
Global Const $cURL_OPT_SEEKDATA = 10000 + 168 ; STRING
Global Const $cURL_OPT_CRLFILE = 10000 + 169 ; STRING ;  CRL file
Global Const $cURL_OPT_ISSUERCERT = 10000 + 170 ; STRING ;  Issuer certificate
Global Const $cURL_OPT_ADDRESS_SCOPE = 171 ; LONG ;  (IPv6) Address scope
Global Const $cURL_OPT_CERTINFO = 172 ; LONG;  Collect certificate chain info and allow it to get retrievable with CURLINFO_CERTINFO after the transfer is complete.
Global Const $cURL_OPT_USERNAME = 10000 + 173 ; STRING ;  "name" to use when fetching.
Global Const $cURL_OPT_PASSWORD = 10000 + 174 ; STRING ;  "pwd" to use when fetching.
Global Const $cURL_OPT_PROXYUSERNAME = 10000 + 175 ; STRING ;  "name" to use with Proxy when fetching.
Global Const $cURL_OPT_PROXYPASSWORD = 10000 + 176 ; STRING ;  "pwd" to use with Proxy when fetching.
Global Const $cURL_OPT_NOPROXY = 10000 + 177 ; STRING ;  Comma separated list of hostnames defining no-proxy zones. These should match both hostnames directly, and hostnames within a domain. For example, local.com will match local.com and www.local.com, but NOT notlocal.com or www.notlocal.com. For compatibility with other implementations of this, .local.com will be considered to be the same as local.com. A single * is the only valid wildcard, and effectively disables the use of proxy.
Global Const $cURL_OPT_TFTP_BLKSIZE = 178 ; LONG ;  block size for TFTP transfers
Global Const $cURL_OPT_SOCKS5_GSSAPI_SERVICE = 10000 + 179 ; STRING ;  Socks Service
Global Const $cURL_OPT_SOCKS5_GSSAPI_NEC = 180 ; LONG ;  Socks Service
Global Const $cURL_OPT_PROTOCOLS = 181 ; LONG ;  set the bitmask for the protocols that are allowed to be used for the transfer, which thus helps the app which takes URLs from users or other external inputs and want to restrict what protocol(s) to deal with. Defaults to CURLPROTO_ALL.
Global Const $cURL_OPT_REDIR_PROTOCOLS = 182 ; LONG ;  set the bitmask for the protocols that libcurl is allowed to follow to, as a subset of the CURLOPT_PROTOCOLS ones. That means the protocol needs to be set in both bitmasks to be allowed to get redirected to. Defaults to all protocols except FILE and SCP.
Global Const $cURL_OPT_SSH_KNOWNHOSTS = 10000 + 183 ; STRING ;  set the SSH knownhost file name to use
;Global Const $cURL_OPT_SSH_KEYFUNCTION = 184 ; CallBack ;  set the SSH host key callback, must point to a curl_sshkeycallback function
Global Const $cURL_OPT_SSH_KEYDATA = 10000 + 185 ; STRING ;  set the SSH host key callback custom pointer
Global Const $cURL_OPT_MAIL_FROM = 10000 + 186 ; STRING ;  set the SMTP mail originator
Global Const $cURL_OPT_MAIL_RCPT = 10000 + 187 ; STRING ;  set the SMTP mail receiver(s)
Global Const $cURL_OPT_FTP_USE_PRET = 188 ; LONG ;  FTP: send PRET before PASV
Global Const $cURL_OPT_RTSP_REQUEST = 189 ; LONG ;  RTSP request method (OPTIONS, SETUP, PLAY, etc...)
Global Const $cURL_OPT_RTSP_SESSION_ID = 10000 + 190 ; STRING ;  The RTSP session identifier
Global Const $cURL_OPT_RTSP_STREAM_URI = 10000 + 191 ; STRING ;  The RTSP stream URI
Global Const $cURL_OPT_RTSP_TRANSPORT = 10000 + 192 ; STRING ;  The Transport: header to use in RTSP requests
Global Const $cURL_OPT_RTSP_CLIENT_CSEQ = 193 ; LONG ;  Manually initialize the client RTSP CSeq for this handle
Global Const $cURL_OPT_RTSP_SERVER_CSEQ = 194 ; LONG ;  Manually initialize the server RTSP CSeq for this handle
Global Const $cURL_OPT_INTERLEAVEDATA = 10000 + 195 ; STRING ;  The stream to pass to INTERLEAVEFUNCTION.
;Global Const $cURL_OPT_INTERLEAVEFUNCTION = 196 ; CallBack ;  Let the application define a custom write method for RTP data
Global Const $cURL_OPT_WILDCARDMATCH = 197 ; LONG ;  Turn on wildcard matching
;Global Const $cURL_OPT_CHUNK_BGN_FUNCTION = 198 ; CallBack ;  Directory matching callback called before downloading of an individual file (chunk) started
;Global Const $cURL_OPT_CHUNK_END_FUNCTION = 199 ; CallBack ;  Directory matching callback called after the file (chunk) was downloaded, or skipped
;Global Const $cURL_OPT_FNMATCH_FUNCTION = 200 ; CallBack ;  Change match (fnmatch-like) callback for wildcard matching
Global Const $cURL_OPT_CHUNK_DATA = 10000 + 201 ; STRING ;  Let the application define custom chunk data pointer
Global Const $cURL_OPT_FNMATCH_DATA = 10000 + 202 ; STRING ;  FNMATCH_FUNCTION user pointer
Global Const $cURL_OPT_RESOLVE = 10000 + 203 ; STRING ;  send linked-list of name:port:address sets
Global Const $cURL_OPT_TLSAUTH_USERNAME = 10000 + 204 ; STRING ;  Set a username for authenticated TLS
Global Const $cURL_OPT_TLSAUTH_PASSWORD = 10000 + 205 ; STRING ;  Set a password for authenticated TLS
Global Const $cURL_OPT_TLSAUTH_TYPE = 10000 + 206 ; STRING ;  Set authentication type for authenticated TLS
Global Const $cURL_OPT_TRANSFER_ENCODING = 207 ; LONG ;  Set to 1 to enable the "TE:" header in HTTP requests to ask for compressed transfer-encoded responses. Set to 0 to disable the use of TE: in outgoing requests. The current default is 0, but it might change in a future libcurl release. libcurl will ask for the compressed methods it knows of, and if that isn't any, it will not ask for transfer-encoding at all even if this option is set to 1.
;Global Const $cURL_OPT_CLOSESOCKETFUNCTION = 208 ; CallBack ;  Callback function for closing socket (instead of close(2)). The callback should have type curl_closesocket_callback
Global Const $cURL_OPT_CLOSESOCKETDATA = 10000 + 209 ; STRING
Global Const $cURL_OPT_GSSAPI_DELEGATION = 210 ; LONG ;  allow GSSAPI credential delegation
Global Const $cURL_OPT_DNS_SERVERS = 10000 + 211 ; STRING ;  Set the name servers to use for DNS resolution
Global Const $cURL_OPT_ACCEPTTIMEOUT_MS = 212 ; LONG ;  Time-out accept operations (currently for FTP only) after this amount of miliseconds.
Global Const $cURL_OPT_TCP_KEEPALIVE = 213 ; LONG ;  Set TCP keepalive
Global Const $cURL_OPT_TCP_KEEPIDLE = 214 ; LONG ;  non-universal keepalive knobs (Linux, AIX, HP-UX, more)
Global Const $cURL_OPT_TCP_KEEPINTVL = 215 ; LONG ;  non-universal keepalive knobs (Linux, AIX, HP-UX, more)
Global Const $cURL_OPT_SSL_OPTIONS = 216 ; LONG ;  Enable/disable specific SSL features with a bitmask, see CURLSSLOPT_*
Global Const $cURL_OPT_MAIL_AUTH = 10000 + 217 ; STRING ;  Set the SMTP auth originator
Global Const $cURL_OPT_SASL_IR = 218 ; LONG ;  Enable/disable SASL initial response
;Global Const $cURL_OPT_XFERINFOFUNCTION = 219 ; CallBack ;  Function that will be called instead of the internal progress display function. This function should be defined as the curl_xferinfo_callback prototype defines. (Deprecates CURLOPT_PROGRESSFUNCTION)
Global Const $cURL_OPT_XOAUTH2_BEARER = 10000 + 220 ; STRING ;  The XOAUTH2 bearer token
Global Const $cURL_OPT_DNS_INTERFACE = 10000 + 221 ; STRING ;  Set the interface string to use as outgoing network interface for DNS requests. Only supported by the c-ares DNS backend
Global Const $cURL_OPT_DNS_LOCAL_IP4 = 10000 + 222 ; STRING ;  Set the local IPv4 address to use for outgoing DNS requests. Only supported by the c-ares DNS backend
Global Const $cURL_OPT_DNS_LOCAL_IP6 = 10000 + 223 ; STRING ;  Set the local IPv4 address to use for outgoing DNS requests. Only supported by the c-ares DNS backend
Global Const $cURL_OPT_LOGIN_OPTIONS = 10000 + 224 ; STRING ;  Set authentication options directly
Global Const $cURL_OPT_SSL_ENABLE_NPN = 225 ; LONG ;  Enable/disable TLS NPN extension (http2 over ssl might fail without)
Global Const $cURL_OPT_SSL_ENABLE_ALPN = 226 ; LONG ;  Enable/disable TLS ALPN extension (http2 over ssl might fail without)
Global Const $cURL_OPT_EXPECT_100_TIMEOUT_MS = 227 ; LONG ;  Time to wait for a response to a HTTP request containing an Expect: 100-continue header before sending the data anyway.
Global Const $cURL_OPT_PROXYHEADER = 10000 + 228 ; STRING ;  This points to a linked list of headers used for proxy requests only, struct curl_slist kind
Global Const $cURL_OPT_HEADEROPT = 229 ; LONG ;  Pass in a bitmask of "header options"
Global Const $cURL_OPT_PINNEDPUBLICKEY = 10000 + 230 ; STRING ;  The public key in DER form used to validate the peer public key this option is used only if SSL_VERIFYPEER is true
Global Const $cURL_OPT_UNIX_SOCKET_PATH = 10000 + 231 ; STRING ;  Path to Unix domain socket
Global Const $cURL_OPT_SSL_VERIFYSTATUS = 232 ; LONG ;  Set if we should verify the certificate status.
Global Const $cURL_OPT_SSL_FALSESTART = 233 ; LONG ;  Set if we should enable TLS false start.
Global Const $cURL_OPT_PATH_AS_IS = 234 ; LONG ;  Do not squash dot-dot sequences

Global Const $cURL_MOPT_PIPELINING = 3 ; LONG ; set to 1 to enable pipelining for this multi handle
Global Const $cURL_MOPT_TIMERDATA = 5 ; OBJECTPOINT ; This is the argument passed to the timer callback
Global Const $cURL_MOPT_MAXCONNECTS = 6 ; LONG ; maximum number of entries in the connection cache
Global Const $cURL_MOPT_MAX_HOST_CONNECTIONS = 7 ; LONG ; maximum number of (pipelining) connections to one host
Global Const $cURL_MOPT_MAX_PIPELINE_LENGTH = 8 ; LONG ; maximum number of requests in a pipeline
Global Const $cURL_MOPT_CONTENT_LENGTH_PENALTY_SIZE = 9 ; OFF_T ; a connection with a content-length longer than this will not be considered for pipelining
Global Const $cURL_MOPT_CHUNK_LENGTH_PENALTY_SIZE = 10 ; OFF_T ; a connection with a chunk length longer than this will not be considered for pipelining
Global Const $cURL_MOPT_PIPELINING_SITE_BL = 11 ; STRING ; a list of site names(+port) that are blacklisted from pipelining
Global Const $cURL_MOPT_PIPELINING_SERVER_BL = 12 ; STRING ; a list of server types that are blacklisted from pipelining
Global Const $cURL_MOPT_MAX_TOTAL_CONNECTIONS = 13 ; LONG ; maximum number of open connections in total

; These enums are for use with the $cURL_OPT_NETRC option.
Global Const $cURL_NETRC_IGNORED = 0 ; The .netrc will never be read. This is the default.
Global Const $cURL_NETRC_OPTIONAL = 1 ; A user:password in the URL will be preferred to one in the .netrc.
Global Const $cURL_NETRC_REQUIRED = 2 ; A user:password in the URL will be ignored. Unless one is set programmatically, the .netrc will be queried.

; These enums are for use with the $cURL_OPT_HTTP_VERSION option.
Global Const $cURL_HTTP_VERSION_NONE = 0 ; setting this means we don't care, and that we'd like the library to choose the best possible for us!
Global Const $cURL_HTTP_VERSION_1_0 = 1 ; please use HTTP 1.0 in the request
Global Const $cURL_HTTP_VERSION_1_1 = 2 ; please use HTTP 1.1 in the request
Global Const $cURL_HTTP_VERSION_2_0 = 3 ; please use HTTP 2.0 in the request

;Below here follows defines for the CURLOPT_IPRESOLVE option. If a host name resolves addresses using more than one IP protocol version, this option might be handy to force libcurl to use a specific IP version.
Global Const $cURL_IPRESOLVE_WHATEVER = 0 ; default, resolves addresses to all IP versions that your system allows
Global Const $cURL_IPRESOLVE_V4 = 1 ; resolve to IPv4 addresses
Global Const $cURL_IPRESOLVE_V6 = 2 ; resolve to IPv6 addresses

; parameter for the $cURL_OPT_USE_SSL option
Global Const $cURL_USESSL_NONE = 0 ; do not attempt to use SSL
Global Const $cURL_USESSL_TRY = 1 ; try using SSL, proceed anyway otherwise
Global Const $cURL_USESSL_CONTROL = 2 ; SSL for the control connection or fail
Global Const $cURL_USESSL_ALL = 3 ; SSL for all communication or fail

; symbols to use with $cURL_OPT_POSTREDIR. $cURL_REDIR_POST_301, $cURL_REDIR_POST_302 and $cURL_REDIR_POST_303 can be bitwise ORed so that $cURL_REDIR_POST_301 | $cURL_REDIR_POST_302 | $cURL_REDIR_POST_303 == $cURL_REDIR_POST_ALL
Global Const $cURL_REDIR_GET_ALL = 0
Global Const $cURL_REDIR_POST_301 = 1
Global Const $cURL_REDIR_POST_302 = 2
Global Const $cURL_REDIR_POST_303 = 4
Global Const $cURL_REDIR_POST_ALL = 7

Global Const $cURL_INFO_STRING = 0x100000
Global Const $cURL_INFO_LONG = 0x200000
Global Const $cURL_INFO_DOUBLE = 0x300000
Global Const $cURL_INFO_SLIST = 0x400000
Global Const $cURL_INFO_MASK = 0x0fffff
Global Const $cURL_INFO_TYPEMASK = 0xf00000

Global Const $cURL_INFO_EFFECTIVE_URL = $cURL_INFO_STRING + 1
Global Const $cURL_INFO_RESPONSE_CODE = $cURL_INFO_LONG + 2
Global Const $cURL_INFO_TOTAL_TIME = $cURL_INFO_DOUBLE + 3
Global Const $cURL_INFO_NAMELOOKUP_TIME = $cURL_INFO_DOUBLE + 4
Global Const $cURL_INFO_CONNECT_TIME = $cURL_INFO_DOUBLE + 5
Global Const $cURL_INFO_PRETRANSFER_TIME = $cURL_INFO_DOUBLE + 6
Global Const $cURL_INFO_SIZE_UPLOAD = $cURL_INFO_DOUBLE + 7
Global Const $cURL_INFO_SIZE_DOWNLOAD = $cURL_INFO_DOUBLE + 8
Global Const $cURL_INFO_SPEED_DOWNLOAD = $cURL_INFO_DOUBLE + 9
Global Const $cURL_INFO_SPEED_UPLOAD = $cURL_INFO_DOUBLE + 10
Global Const $cURL_INFO_HEADER_SIZE = $cURL_INFO_LONG + 11
Global Const $cURL_INFO_REQUEST_SIZE = $cURL_INFO_LONG + 12
Global Const $cURL_INFO_SSL_VERIFYRESULT = $cURL_INFO_LONG + 13
Global Const $cURL_INFO_FILETIME = $cURL_INFO_LONG + 14
Global Const $cURL_INFO_CONTENT_LENGTH_DOWNLOAD = $cURL_INFO_DOUBLE + 15
Global Const $cURL_INFO_CONTENT_LENGTH_UPLOAD = $cURL_INFO_DOUBLE + 16
Global Const $cURL_INFO_STARTTRANSFER_TIME = $cURL_INFO_DOUBLE + 17
Global Const $cURL_INFO_CONTENT_TYPE = $cURL_INFO_STRING + 18
Global Const $cURL_INFO_REDIRECT_TIME = $cURL_INFO_DOUBLE + 19
Global Const $cURL_INFO_REDIRECT_COUNT = $cURL_INFO_LONG + 20
Global Const $cURL_INFO_PRIVATE = $cURL_INFO_STRING + 21
Global Const $cURL_INFO_HTTP_CONNECTCODE = $cURL_INFO_LONG + 22
Global Const $cURL_INFO_HTTPAUTH_AVAIL = $cURL_INFO_LONG + 23
Global Const $cURL_INFO_PROXYAUTH_AVAIL = $cURL_INFO_LONG + 24
Global Const $cURL_INFO_OS_ERRNO = $cURL_INFO_LONG + 25
Global Const $cURL_INFO_NUM_CONNECTS = $cURL_INFO_LONG + 26
Global Const $cURL_INFO_SSL_ENGINES = $cURL_INFO_SLIST + 27
Global Const $cURL_INFO_COOKIELIST = $cURL_INFO_SLIST + 28
Global Const $cURL_INFO_LASTSOCKET = $cURL_INFO_LONG + 29
Global Const $cURL_INFO_FTP_ENTRY_PATH = $cURL_INFO_STRING + 30
Global Const $cURL_INFO_REDIRECT_URL = $cURL_INFO_STRING + 31
Global Const $cURL_INFO_PRIMARY_IP = $cURL_INFO_STRING + 32
Global Const $cURL_INFO_APPCONNECT_TIME = $cURL_INFO_DOUBLE + 33
Global Const $cURL_INFO_CERTINFO = $cURL_INFO_SLIST + 34
Global Const $cURL_INFO_CONDITION_UNMET = $cURL_INFO_LONG + 35
Global Const $cURL_INFO_RTSP_SESSION_ID = $cURL_INFO_STRING + 36
Global Const $cURL_INFO_RTSP_CLIENT_CSEQ = $cURL_INFO_LONG + 37
Global Const $cURL_INFO_RTSP_SERVER_CSEQ = $cURL_INFO_LONG + 38
Global Const $cURL_INFO_RTSP_CSEQ_RECV = $cURL_INFO_LONG + 39
Global Const $cURL_INFO_PRIMARY_PORT = $cURL_INFO_LONG + 40
Global Const $cURL_INFO_LOCAL_IP = $cURL_INFO_STRING + 41
Global Const $cURL_INFO_LOCAL_PORT = $cURL_INFO_LONG + 42
Global Const $cURL_INFO_TLS_SESSION = $cURL_INFO_SLIST + 43

Global Const $cURL_PAUSE_RECV = 2
Global Const $cURL_PAUSE_RECV_CONT = 0
Global Const $cURL_PAUSE_SEND = 4
Global Const $cURL_PAUSE_SEND_CONT = 0
Global Const $cURL_PAUSE_ALL = BitOR($cURL_PAUSE_RECV, $cURL_PAUSE_SEND)
Global Const $cURL_PAUSE_CONT = BitOR($cURL_PAUSE_RECV_CONT, $cURL_PAUSE_SEND_CONT)

Global Const $cURL_EOK = 0
Global Const $cURL_EUNSUPPORTED_PROTOCOL = 1
Global Const $cURL_EFAILED_INIT = 2
Global Const $cURL_EURL_MALFORMAT = 3
Global Const $cURL_ENOT_BUILT_IN = 4
Global Const $cURL_ECOULDNT_RESOLVE_PROXY = 5
Global Const $cURL_ECOULDNT_RESOLVE_HOST = 6
Global Const $cURL_ECOULDNT_CONNECT = 7
Global Const $cURL_EFTP_WEIRD_SERVER_REPLY = 8
Global Const $cURL_EREMOTE_ACCESS_DENIED = 9 ; a service was denied by the server due to lack of access - when login fails this is not returned.
Global Const $cURL_EFTP_ACCEPT_FAILED = 10
Global Const $cURL_EFTP_WEIRD_PASS_REPLY = 11
Global Const $cURL_EFTP_ACCEPT_TIMEOUT = 12 ; timeout occurred accepting server
Global Const $cURL_EFTP_WEIRD_PASV_REPLY = 13
Global Const $cURL_EFTP_WEIRD_227_FORMAT = 14
Global Const $cURL_EFTP_CANT_GET_HOST = 15
Global Const $cURL_EHTTP2 = 16 ; A problem in the http2 framing layer.
Global Const $cURL_EFTP_COULDNT_SET_TYPE = 17
Global Const $cURL_EPARTIAL_FILE = 18
Global Const $cURL_EFTP_COULDNT_RETR_FILE = 19
Global Const $cURL_EQUOTE_ERROR = 21 ; quote command failure
Global Const $cURL_EHTTP_RETURNED_ERROR = 22
Global Const $cURL_EWRITE_ERROR = 23
Global Const $cURL_EUPLOAD_FAILED = 25 ; failed upload "command"
Global Const $cURL_EREAD_ERROR = 26 ; couldn't open/read from file
Global Const $cURL_EOUT_OF_MEMORY = 27 ; may sometimes indicate a conversion error instead of a memory allocation error if $cURL_DOES_CONVERSIONS is defined
Global Const $cURL_EOPERATION_TIMEDOUT = 28 ; the timeout time was reached
Global Const $cURL_EFTP_PORT_FAILED = 30 ; FTP PORT operation failed
Global Const $cURL_EFTP_COULDNT_USE_REST = 31 ; the REST command failed
Global Const $cURL_ERANGE_ERROR = 33 ; RANGE "command" didn't work
Global Const $cURL_EHTTP_POST_ERROR = 34
Global Const $cURL_ESSL_CONNECT_ERROR = 35 ; wrong when connecting with SSL
Global Const $cURL_EBAD_DOWNLOAD_RESUME = 36 ; couldn't resume download
Global Const $cURL_EFILE_COULDNT_READ_FILE = 37
Global Const $cURL_ELDAP_CANNOT_BIND = 38
Global Const $cURL_ELDAP_SEARCH_FAILED = 39
Global Const $cURL_EFUNCTION_NOT_FOUND = 41
Global Const $cURL_EABORTED_BY_CALLBACK = 42
Global Const $cURL_EBAD_FUNCTION_ARGUMENT = 43
Global Const $cURL_EINTERFACE_FAILED = 45 ; CURLOPT_INTERFACE failed
Global Const $cURL_ETOO_MANY_REDIRECTS = 47 ; catch endless re-direct loops
Global Const $cURL_EUNKNOWN_OPTION = 48 ; User specified an unknown option
Global Const $cURL_ETELNET_OPTION_SYNTAX = 49 ; Malformed telnet option
Global Const $cURL_EPEER_FAILED_VERIFICATION = 51 ; peer's certificate or fingerprint wasn't verified fine
Global Const $cURL_EGOT_NOTHING = 52 ; when this is a specific error
Global Const $cURL_ESSL_ENGINE_NOTFOUND = 53 ; SSL crypto engine not found
Global Const $cURL_ESSL_ENGINE_SETFAILED = 54 ; can not set SSL crypto engine as default
Global Const $cURL_ESEND_ERROR = 55 ; failed sending network data
Global Const $cURL_ERECV_ERROR = 56 ; failure in receiving network data
Global Const $cURL_ESSL_CERTPROBLEM = 58 ; problem with the local certificate
Global Const $cURL_ESSL_CIPHER = 59 ; couldn't use specified cipher
Global Const $cURL_ESSL_CACERT = 60 ; problem with the CA cert (path?)
Global Const $cURL_EBAD_CONTENT_ENCODING = 62 ; Unrecognized/bad encoding
Global Const $cURL_ELDAP_INVALID_URL = 62 ; Invalid LDAP URL
Global Const $cURL_EFILESIZE_EXCEEDED = 63 ; Maximum file size exceeded
Global Const $cURL_EUSE_SSL_FAILED = 64 ; Requested FTP SSL level failed
Global Const $cURL_ESEND_FAIL_REWIND = 65 ; Sending the data requires a rewind that failed
Global Const $cURL_ESSL_ENGINE_INITFAILED = 66 ; failed to initialise ENGINE
Global Const $cURL_ELOGIN_DENIED = 67 ; user, password or similar was not accepted and we failed to login
Global Const $cURL_ETFTP_NOTFOUND = 68 ; file not found on server
Global Const $cURL_ETFTP_PERM = 69 ; permission problem on server
Global Const $cURL_EREMOTE_DISK_FULL = 70 ; out of disk space on server
Global Const $cURL_ETFTP_ILLEGAL = 71 ; Illegal TFTP operation
Global Const $cURL_ETFTP_UNKNOWNID = 72 ; Unknown transfer ID
Global Const $cURL_EREMOTE_FILE_EXISTS = 73 ; File already exists
Global Const $cURL_ETFTP_NOSUCHUSER = 74 ; No such user
Global Const $cURL_ECONV_FAILED = 75 ; conversion failed
Global Const $cURL_ECONV_REQD = 76 ; caller must register conversion callbacks using curl_easy_setopt options $cURL_OPT_CONV_FROM_NETWORK_FUNCTION, $cURL_OPT_CONV_TO_NETWORK_FUNCTION, and $cURL_OPT_CONV_FROM_UTF8_FUNCTION
Global Const $cURL_ESSL_CACERT_BADFILE = 77 ; could not load CACERT file, missing or wrong format
Global Const $cURL_EREMOTE_FILE_NOT_FOUND = 78 ; remote file not found
Global Const $cURL_ESSH = 79 ; error from the SSH layer, somewhat generic so the error message will be of interest when this has happened
Global Const $cURL_ESSL_SHUTDOWN_FAILED = 80 ; Failed to shut down the SSL connection
Global Const $cURL_EAGAIN = 81 ; socket is not ready for send/recv, wait till it's ready and try again (Added in 7.18.2)
Global Const $cURL_ESSL_CRL_BADFILE = 82 ; could not load CRL file, missing or wrong format (Added in 7.19.0)
Global Const $cURL_ESSL_ISSUER_ERROR = 83 ; Issuer check failed. (Added in 7.19.0)
Global Const $cURL_EFTP_PRET_FAILED = 84 ; a PRET command failed
Global Const $cURL_ERTSP_CSEQ_ERROR = 85 ; mismatch of RTSP CSeq numbers
Global Const $cURL_ERTSP_SESSION_ERROR = 86 ; mismatch of RTSP Session Ids
Global Const $cURL_EFTP_BAD_FILE_LIST = 87 ; unable to parse FTP file list
Global Const $cURL_ECHUNK_FAILED = 88 ; chunk callback reported error
Global Const $cURL_ENO_CONNECTION_AVAILABLE = 89 ; No connection available, the session will be queued
Global Const $cURL_ESSL_PINNEDPUBKEYNOTMATCH = 90 ; specified pinned public key did not match
Global Const $cURL_ESSL_INVALIDCERTSTATUS = 91 ; invalid certificate status

Global Const $cURL_VERSION_IPV6 = 1 ; IPv6-enabled
;Global Const $cURL_VERSION_KERBEROS4 = 2 ; Kerberos V4 auth is supported (deprecated)
Global Const $cURL_VERSION_SSL = 4 ; SSL options are present
Global Const $cURL_VERSION_LIBZ = 8 ; libz features are present
Global Const $cURL_VERSION_NTLM = 16 ; NTLM auth is supported
;Global Const $cURL_VERSION_GSSNEGOTIATE = 32 ; Negotiate auth is supported (deprecated)
Global Const $cURL_VERSION_DEBUG = 64 ; Built with debug capabilities
Global Const $cURL_VERSION_ASYNCHDNS = 128 ; Asynchronous DNS resolves
Global Const $cURL_VERSION_SPNEGO = 256 ; SPNEGO auth is supported
Global Const $cURL_VERSION_LARGEFILE = 512 ; Supports files larger than 2GB
Global Const $cURL_VERSION_IDN = 1024 ; Internationized Domain Names are supported
Global Const $cURL_VERSION_SSPI = 2048 ; Built against Windows SSPI
Global Const $cURL_VERSION_CONV = 4096 ; Character conversions supported
Global Const $cURL_VERSION_CURLDEBUG = 8192 ; Debug memory tracking supported
Global Const $cURL_VERSION_TLSAUTH_SRP = 16384 ; TLS-SRP auth is supported
Global Const $cURL_VERSION_NTLM_WB = 32768 ; NTLM delegation to winbind helper is suported
Global Const $cURL_VERSION_HTTP2 = 65536 ; HTTP2 support built-in
Global Const $cURL_VERSION_GSSAPI = 131072 ; Built against a GSS-API library
Global Const $cURL_VERSION_KERBEROS5 = 262144 ; Kerberos V5 auth is supported
Global Const $cURL_VERSION_UNIX_SOCKETS = 524288 ; Unix domain sockets support

Global Const $cURL_VERSION_FIRST=0
Global Const $cURL_VERSION_SECOND=1
Global Const $cURL_VERSION_THIRD=2
Global Const $cURL_VERSION_FOURTH=3
; ===============================================================================================================================
