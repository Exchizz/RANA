/****************************************************************************
** Meta object code from reading C++ file 'runner.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.5.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/runner.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'runner.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.5.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_Runner_t {
    QByteArrayData data[7];
    char stringdata0[63];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_Runner_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_Runner_t qt_meta_stringdata_Runner = {
    {
QT_MOC_LITERAL(0, 0, 6), // "Runner"
QT_MOC_LITERAL(1, 7, 14), // "simulationDone"
QT_MOC_LITERAL(2, 22, 0), // ""
QT_MOC_LITERAL(3, 23, 6), // "doWork"
QT_MOC_LITERAL(4, 30, 12), // "FlowControl*"
QT_MOC_LITERAL(5, 43, 11), // "agentDomain"
QT_MOC_LITERAL(6, 55, 7) // "runTime"

    },
    "Runner\0simulationDone\0\0doWork\0"
    "FlowControl*\0agentDomain\0runTime"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Runner[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       2,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   24,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       3,    2,   25,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void, 0x80000000 | 4, QMetaType::ULongLong,    5,    6,

       0        // eod
};

void Runner::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Runner *_t = static_cast<Runner *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->simulationDone(); break;
        case 1: _t->doWork((*reinterpret_cast< FlowControl*(*)>(_a[1])),(*reinterpret_cast< unsigned long long(*)>(_a[2]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (Runner::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&Runner::simulationDone)) {
                *result = 0;
            }
        }
    }
}

const QMetaObject Runner::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_Runner.data,
      qt_meta_data_Runner,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *Runner::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Runner::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_Runner.stringdata0))
        return static_cast<void*>(const_cast< Runner*>(this));
    return QObject::qt_metacast(_clname);
}

int Runner::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 2)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 2)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 2;
    }
    return _id;
}

// SIGNAL 0
void Runner::simulationDone()
{
    QMetaObject::activate(this, &staticMetaObject, 0, Q_NULLPTR);
}
QT_END_MOC_NAMESPACE
