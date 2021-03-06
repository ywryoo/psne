/// source code from qwt examples
/// Modified by Ryangwook Ryoo, 2017

#ifndef _PLOT_H_
#define _PLOT_H_

#include <qwt_plot.h>
#include <QColormap>
#include <qwt_color_map.h>
#include <vector>

class QwtPlotCurve;
class QwtSymbol;
class QwtColorMap;
class HueColorMap;

class Plot : public QwtPlot
{
    Q_OBJECT

public:
    Plot( QWidget *parent = NULL );
    void setLabels(int max);
    void setSymbol( QwtSymbol * );
    void setSamples( const QVector<QPointF> &samples );
    void setSamplesWithLabels(double* Y, int* data_labels, int N, int no_dims);
    QwtPlotCurve *default_curve;
    QwtPlotCurve** d_curves = NULL;
    int label_num = 0;
    std::vector<std::vector<int>> mappingtable;
};

#endif // _PLOT_H_
