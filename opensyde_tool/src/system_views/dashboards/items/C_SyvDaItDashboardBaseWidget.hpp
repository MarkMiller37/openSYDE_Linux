//----------------------------------------------------------------------------------------------------------------------
/*!
   \file
   \brief       Widget base for dashboard widgets (header)

   See cpp file for detailed description

   \copyright   Copyright 2017 Sensor-Technik Wiedemann GmbH. All rights reserved.
*/
//----------------------------------------------------------------------------------------------------------------------
#ifndef C_SYVDADASHBOARDBASEWIDGET_HPP
#define C_SYVDADASHBOARDBASEWIDGET_HPP

/* -- Includes ------------------------------------------------------------------------------------------------------ */
#include <QWidget>

/* -- Namespace ----------------------------------------------------------------------------------------------------- */
namespace Ui
{
class C_SyvDaItDashboardBaseWidget;
}

namespace stw
{
namespace opensyde_gui
{
/* -- Global Constants ---------------------------------------------------------------------------------------------- */

/* -- Types --------------------------------------------------------------------------------------------------------- */
class C_SyvDaItDashboardBaseWidget :
   public QWidget
{
   Q_OBJECT

public:
   explicit C_SyvDaItDashboardBaseWidget(QWidget * const opc_Parent = NULL);
   ~C_SyvDaItDashboardBaseWidget(void) override;

   void SetWidget(QWidget * const opc_Content);

protected:
   void resizeEvent(QResizeEvent * const opc_Event) override;

private:
   Ui::C_SyvDaItDashboardBaseWidget * mpc_Ui;
   QWidget * mpc_Widget;

   //Avoid call
   C_SyvDaItDashboardBaseWidget(const C_SyvDaItDashboardBaseWidget &);
   C_SyvDaItDashboardBaseWidget & operator =(const C_SyvDaItDashboardBaseWidget &) &;
};

/* -- Extern Global Variables --------------------------------------------------------------------------------------- */
}
} //end of namespace

#endif
