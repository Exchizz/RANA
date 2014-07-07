#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QtWidgets>
#include <QGraphicsScene>
#include <map>

#include "graphics/agentItem.h"
#include "utility.h"


namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    void write_output(const char *argMsg);
    void updateMap();

    ~MainWindow();

    void refreshPopulation(std::list<agentInfo> infolist);  
    void advanceProgess(int percentage);

private slots:

    void on_generateButton_clicked();

    void on_exitButton_clicked();

    void on_browseMapButton_clicked();

    void updatePosition(int Id, int x, int y);

    void on_generateMap_clicked();

private:
    Ui::MainWindow *ui;

    void advanceProgess();

    static QImage *image;
    QGraphicsScene scene;
    QMap<int, agentItem* > graphAgents;
    QPixmap map;

};

#endif // MAINWINDOW_H