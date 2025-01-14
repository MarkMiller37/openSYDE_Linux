//----------------------------------------------------------------------------------------------------------------------
/*!
   \file
   \brief       Push button part of push button item (implementation)

   Push button part of push button item.
   This class does not contain any functionality,
   but needs to exist, to have a unique group,
   to apply a specific stylesheet for.

   \copyright   Copyright 2017 Sensor-Technik Wiedemann GmbH. All rights reserved.
*/
//----------------------------------------------------------------------------------------------------------------------

/* -- Includes ------------------------------------------------------------------------------------------------------ */
#include "precomp_headers.hpp"

#include <QPainter>

#include "stwtypes.hpp"
#include "C_OgePubDashboard.hpp"

/* -- Used Namespaces ----------------------------------------------------------------------------------------------- */
using namespace stw::opensyde_gui_elements;

/* -- Module Global Constants --------------------------------------------------------------------------------------- */

/* -- Types --------------------------------------------------------------------------------------------------------- */

/* -- Global Variables ---------------------------------------------------------------------------------------------- */

/* -- Module Global Variables --------------------------------------------------------------------------------------- */

/* -- Module Global Function Prototypes ----------------------------------------------------------------------------- */

/* -- Implementation ------------------------------------------------------------------------------------------------ */

//----------------------------------------------------------------------------------------------------------------------
/*! \brief   Default constructor

   Set up GUI with all elements.

   \param[in,out] opc_Parent Optional pointer to parent
*/
//----------------------------------------------------------------------------------------------------------------------
C_OgePubDashboard::C_OgePubDashboard(QWidget * const opc_Parent) :
   QPushButton(opc_Parent),
   mpc_RendererActivated(NULL),
   mpc_RendererDeactivated(NULL)
{
   this->setCheckable(true);
}

//----------------------------------------------------------------------------------------------------------------------
/*! \brief   Default destructor

   Clean up.
*/
//----------------------------------------------------------------------------------------------------------------------
C_OgePubDashboard::~C_OgePubDashboard(void)
{
   delete this->mpc_RendererActivated;
   delete this->mpc_RendererDeactivated;
}

//----------------------------------------------------------------------------------------------------------------------
/*! \brief   Set SVG paths

   \param[in] orc_SvgActivated   Activated SVG path
   \param[in] orc_SvgDeactivated Deactivated SVG path
*/
//----------------------------------------------------------------------------------------------------------------------
void C_OgePubDashboard::SetFiles(const QString & orc_SvgActivated, const QString & orc_SvgDeactivated)
{
   delete this->mpc_RendererActivated;
   delete this->mpc_RendererDeactivated;
   if (orc_SvgActivated.compare("") == 0)
   {
      this->mpc_RendererActivated = NULL;
   }
   else
   {
      this->mpc_RendererActivated = new QSvgRenderer(orc_SvgActivated);
   }
   if (orc_SvgDeactivated.compare("") == 0)
   {
      this->mpc_RendererDeactivated = NULL;
   }
   else
   {
      this->mpc_RendererDeactivated = new QSvgRenderer(orc_SvgDeactivated);
   }
}

//----------------------------------------------------------------------------------------------------------------------
/*! \brief   Overwritten paint event slot

   Here: paint svgs

   \param[in,out] opc_Event Event identification and information
*/
//----------------------------------------------------------------------------------------------------------------------
void C_OgePubDashboard::paintEvent(QPaintEvent * const opc_Event)
{
   Q_UNUSED(opc_Event)
   if ((this->isChecked() == true) && (this->mpc_RendererActivated != NULL))
   {
      QPainter c_Painter(this);
      const QRectF c_Tmp = mh_AdaptToAspcetRatio(this->mpc_RendererActivated->viewBox(), this->rect());
      this->mpc_RendererActivated->render(&c_Painter, c_Tmp);
   }
   else if (this->mpc_RendererDeactivated != NULL)
   {
      QPainter c_Painter(this);
      const QRectF c_Tmp = mh_AdaptToAspcetRatio(this->mpc_RendererDeactivated->viewBox(), this->rect());
      this->mpc_RendererDeactivated->render(&c_Painter, c_Tmp);
   }
   else
   {
      //Nothing to paint
   }
}

//----------------------------------------------------------------------------------------------------------------------
/*! \brief   Adapt rect to aspect ratio of other rect

   \param[in] orc_Target Target aspect ratio
   \param[in] orc_Rect   Rect to adapt

   \return
   Adapted rect with new aspect ratio
*/
//----------------------------------------------------------------------------------------------------------------------
QRectF C_OgePubDashboard::mh_AdaptToAspcetRatio(const QRect & orc_Target, const QRect & orc_Rect)
{
   QRectF c_Retval = orc_Rect;
   const float64_t f64_IdealAspectRatio = static_cast<float64_t>(orc_Target.height()) /
                                          static_cast<float64_t>(orc_Target.width());
   const float64_t f64_IdealHeight =
      std::min(static_cast<float64_t>(orc_Rect.height()),
               static_cast<float64_t>(orc_Rect.width()) * f64_IdealAspectRatio);

   c_Retval.setHeight(f64_IdealHeight);
   c_Retval.setWidth(f64_IdealHeight / f64_IdealAspectRatio);

   return c_Retval;
}
