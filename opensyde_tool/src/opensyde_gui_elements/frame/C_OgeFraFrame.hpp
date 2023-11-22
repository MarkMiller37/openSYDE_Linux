//----------------------------------------------------------------------------------------------------------------------
/*!
   \file
   \brief       Custom draw frame (header)

   Custom draw frame (note: main module description should be in .cpp file)

   \copyright   Copyright 2016 Sensor-Technik Wiedemann GmbH. All rights reserved.
*/
//----------------------------------------------------------------------------------------------------------------------
#ifndef C_OGEFRAFRAME_HPP
#define C_OGEFRAFRAME_HPP

/* -- Includes ------------------------------------------------------------------------------------------------------ */

#include <QFrame>

/* -- Namespace ----------------------------------------------------------------------------------------------------- */
namespace stw
{
namespace opensyde_gui_elements
{
/* -- Global Constants ---------------------------------------------------------------------------------------------- */

/* -- Types --------------------------------------------------------------------------------------------------------- */

class C_OgeFraFrame :
   public QFrame
{
   Q_OBJECT

public:
   C_OgeFraFrame(QWidget * const opc_Parent = NULL);
};

/* -- Extern Global Variables --------------------------------------------------------------------------------------- */
}
} //end of namespace

#endif
