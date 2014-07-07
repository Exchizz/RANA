#include <QApplication>
#include <QtGui>
#include <QFileDialog>
#include <QMessageBox>

#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "physics/maphandler.h"
#include "physics/phys.h"

QImage *MainWindow::image = NULL;

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    ui->progressBar->setMaximum(100);
    ui->progressBar->setMinimum(0);
    ui->progressBar->setValue(0);
    ui->graphicsView->setScene(&scene);

}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_generateButton_clicked()
{
    updatePosition(3,300,200);
    //if(ui->progressBar->value()==100)
    //{
    //    ui->progressBar->setValue(0);
    //}
    //ui->progressBar->setValue(ui->progressBar->value()+10);

}

void MainWindow::advanceProgess(int percentage)
{
    ui->progressBar->setValue(percentage);
}

void MainWindow::on_exitButton_clicked()
{
    QApplication::quit();
}

void MainWindow::on_browseMapButton_clicked()
{
    QString fileName = QFileDialog::getOpenFileName
            (this, tr("Open Map File"),QDir::currentPath(),
             tr("Image Files (*.png *.jpg *.bmp)"));

    ui->mapPathLineEdit->setText(fileName);

    if(!fileName.isEmpty()){
        delete image;
        image = new QImage(ui->mapPathLineEdit->text());
        if(image->isNull()){
            QMessageBox::information(this,tr("Image Viewer"),
                                     tr("Cannot Load %1.").arg(fileName));
            return;
        }
        //ui->imageLabel->setPixmap(QPixmap::fromImage(*image));
        //map.fromImage(*image);
        //scene.addPixmap(QPixmap::fromImage(*image));
        //map = QPixmap(fileName);
        map.convertFromImage(*image);
        scene.setSceneRect(map.rect());
        scene.setBackgroundBrush(map.scaled(map.size()));
        ui->graphicsView->setMaximumSize(map.width()+10,map.height()+10);

        MapHandler::setImage(image);

        //Phys::setEnvironment(image->width(),image->height());
    }

    updatePosition(3,200,200);
    updatePosition(4,30,100);
}

void MainWindow::on_generateMap_clicked()
{
    if(image != NULL)
        delete image;

    image = new QImage(ui->pxSpinBox->value(), ui->pySpinBox->value(),
                       QImage::Format_RGB32);

    image->fill(Qt::GlobalColor::white);

    QRgb value = qRgb(0,0,0);

    for(int x = 0; x < image->width(); x++)
    {
        for(int y = 0; y < image->height(); y++)
        {
            if(Phys::getMersenneFloat(0,1) < ui->densityDoubleSpinBox->value())
            {
                image->setPixel(x,y, value);
            }
        }
    }
    map.convertFromImage(*image);
    scene.setSceneRect(map.rect());
    scene.setBackgroundBrush(map.scaled(map.size()));

    ui->graphicsView->setMaximumSize(map.width()+10,map.height()+10);

    Phys::setEnvironment(image->width(),image->height());
}


void MainWindow::write_output(const char *argMsg)
{
    ui->outputTextEdit->append(QString::fromStdString(argMsg));
}

void MainWindow::updateMap()
{
    scene.setBackgroundBrush(map.scaled(map.size()));
}

void MainWindow::updatePosition(int Id, int x, int y)
{
    if(!graphAgents.contains(Id))
    {
        agentItem *gfxItem = new agentItem(QString::number(Id));

        gfxItem->setX(x);
        gfxItem->setY(y);
        scene.addItem(gfxItem);
        graphAgents.insert(Id, gfxItem);
    } else
    {
        QMap<int, agentItem*>::const_iterator i = graphAgents.find(Id);
        agentItem *gfxItem = i.value();
        gfxItem->setX(x);
        gfxItem->setY(y);
    }

}

void MainWindow::refreshPopulation(std::list<agentInfo> infolist)
{
    std::list<agentInfo>::iterator itr;

    for(itr = infolist.begin(); itr != infolist.end(); itr++)
    {
        updatePosition(itr->id, itr->x, itr->y);
    }
}
