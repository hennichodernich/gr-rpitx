/* -*- c++ -*- */
/*
 * Copyright 2026 jmf.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

#ifndef INCLUDED_RPITX_RPITX_SINK_H
#define INCLUDED_RPITX_RPITX_SINK_H

#include <gnuradio/rpitx/api.h>
#include <gnuradio/sync_block.h>

namespace gr {
  namespace rpitx {

    /*!
     * \brief <+description of block+>
     * \ingroup rpitx
     *
     */
    class RPITX_API rpitx_sink : virtual public gr::sync_block
    {
     public:
      typedef std::shared_ptr<rpitx_sink> sptr;

      /*!
       * \brief Return a shared_ptr to a new instance of rpitx::rpitx_sink.
       *
       * To avoid accidental use of raw pointers, rpitx::rpitx_sink's
       * constructor is in a private implementation
       * class. rpitx::rpitx_sink::make is the public interface for
       * creating new instances.
       */
      static sptr make(float samp_rate, float carrier_freq);
      virtual void set_freq(float carrier_freq) = 0;      
    };

  } // namespace rpitx
} // namespace gr

#endif /* INCLUDED_RPITX_RPITX_SINK_H */
