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
typedef struct OSAlarm OSAlarm, *POSAlarm;

struct OSAlarm {
    undefined field_0x0;
    undefined field_0x1;
    undefined field_0x2;
    undefined field_0x3;
    undefined field_0x4;
    undefined field_0x5;
    undefined field_0x6;
    undefined field_0x7;
    undefined field_0x8;
    undefined field_0x9;
    undefined field_0xa;
    undefined field_0xb;
    undefined field_0xc;
    undefined field_0xd;
    undefined field_0xe;
    undefined field_0xf;
    undefined field_0x10;
    undefined field_0x11;
    undefined field_0x12;
    undefined field_0x13;
    undefined field_0x14;
    undefined field_0x15;
    undefined field_0x16;
    undefined field_0x17;
    undefined field_0x18;
    undefined field_0x19;
    undefined field_0x1a;
    undefined field_0x1b;
    undefined field_0x1c;
    undefined field_0x1d;
    undefined field_0x1e;
    undefined field_0x1f;
    undefined field_0x20;
    undefined field_0x21;
    undefined field_0x22;
    undefined field_0x23;
    undefined field_0x24;
    undefined field_0x25;
    undefined field_0x26;
    undefined field_0x27;
    undefined field_0x28;
    undefined field_0x29;
    undefined field_0x2a;
    undefined field_0x2b;
    undefined field_0x2c;
    undefined field_0x2d;
    undefined field_0x2e;
    undefined field_0x2f;
};

typedef struct OSContext OSContext, *POSContext;

typedef uint u32;

typedef ulonglong u64;

typedef ushort u16;

struct OSContext {
    u32 gpr[32];
    u32 cr;
    u32 lr;
    u32 ctr;
    u32 xer;
    double fpr[32];
    u64 fpscr;
    u32 srr0;
    u32 srr1;
    u16 dummy;
    u16 state;
    u32 gqr[8];
    u32 psf_padding;
    double psf[32];
};

typedef struct OSMutex OSMutex, *POSMutex;

typedef struct OSThreadQueue OSThreadQueue, *POSThreadQueue;

typedef struct OSThread OSThread, *POSThread;

typedef int s32;

typedef struct OSMutexLink OSMutexLink, *POSMutexLink;

typedef struct OSThreadLink OSThreadLink, *POSThreadLink;

typedef struct OSMutexQueue OSMutexQueue, *POSMutexQueue;

struct OSMutexQueue {
    struct OSMutex * head;
    struct OSMutex * tail;
};

struct OSThreadQueue {
    struct OSThread * head;
    struct OSThread * tail;
};

struct OSThreadLink {
    struct OSThread * next;
    struct OSThread * prev;
};

struct OSThread {
    struct OSContext context;
    u16 state;
    u16 is_detached;
    s32 suspend;
    s32 effective_priority;
    s32 base_priority;
    u32 exit_code_addr;
    struct OSThreadQueue * queue;
    struct OSThreadLink queue_link;
    struct OSThreadQueue join_queue;
    struct OSMutex * mutex;
    struct OSMutexQueue mutex_queue;
    struct OSThreadLink thread_link;
    u32 stack_addr;
    u32 stack_end;
    s32 error;
    u32 specific[2];
};

struct OSMutexLink {
    struct OSMutex * next;
    struct OSMutex * prev;
};

struct OSMutex {
    struct OSThreadQueue thread_queue;
    struct OSThread * owner;
    s32 lock_count;
    struct OSMutexLink link;
};

