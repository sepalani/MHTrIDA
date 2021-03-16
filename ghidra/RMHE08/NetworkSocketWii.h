typedef unsigned char   undefined;

typedef unsigned char    bool;
typedef unsigned char    byte;
typedef long long    longlong;
typedef unsigned int    uint;
typedef unsigned long    ulong;
typedef unsigned long long    ulonglong;
typedef unsigned char    undefined1;
typedef unsigned short    undefined2;
typedef unsigned int    undefined4;
typedef unsigned long long    undefined6;
typedef unsigned long long    undefined8;
typedef unsigned short    ushort;
typedef short    wchar_t;
typedef struct NetworkSocketWii NetworkSocketWii, *PNetworkSocketWii;

typedef enum NetworkSocketWiiType {
    TCP=1,
    UDP=2,
    SSL=4
} NetworkSocketWiiType;

struct NetworkSocketWii {
    void * * vtable;
    void * field_0x4;
    int last_error;
    int socket_fd;
    int is_bound;
    enum NetworkSocketWiiType type;
    int ssl_ctx;
    char is_connected;
    undefined field_0x1d;
    undefined field_0x1e;
    undefined field_0x1f;
    undefined field_0x20;
    undefined field_0x21;
    undefined field_0x22;
    undefined field_0x23;
};

