// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : AvalonClockDomainCrossingBridge
// Git hash  : 5502e4f7f60ee9ef0a1edd7bca2b2dd6cbcea819



module AvalonClockDomainCrossingBridge (
  input               s0_clock,
  input               s0_reset,
  input               m0_clock,
  input               m0_reset,
  output              s0_waitrequest_valid,
  input               s0_waitrequest_ready,
  output              s0_waitrequest_payload,
  output              s0_readdata_valid,
  input               s0_readdata_ready,
  output     [63:0]   s0_readdata_payload,
  output              s0_readdatavalid_valid,
  input               s0_readdatavalid_ready,
  output              s0_readdatavalid_payload,
  input               s0_burstbegin_valid,
  output              s0_burstbegin_ready,
  input               s0_burstbegin_payload,
  input               s0_burstcount_valid,
  output              s0_burstcount_ready,
  input      [7:0]    s0_burstcount_payload,
  input               s0_writedata_valid,
  output              s0_writedata_ready,
  input      [63:0]   s0_writedata_payload,
  input               s0_address_valid,
  output              s0_address_ready,
  input      [25:0]   s0_address_payload,
  input               s0_read_valid,
  output              s0_read_ready,
  input               s0_read_payload,
  input               s0_write_valid,
  output              s0_write_ready,
  input               s0_write_payload,
  input               s0_byteenable_valid,
  output              s0_byteenable_ready,
  input      [7:0]    s0_byteenable_payload,
  input               m0_waitrequest_valid,
  output              m0_waitrequest_ready,
  input               m0_waitrequest_payload,
  input               m0_readdata_valid,
  output              m0_readdata_ready,
  input      [63:0]   m0_readdata_payload,
  input               m0_readdatavalid_valid,
  output              m0_readdatavalid_ready,
  input               m0_readdatavalid_payload,
  output              m0_burstbegin_valid,
  input               m0_burstbegin_ready,
  output              m0_burstbegin_payload,
  output              m0_burstcount_valid,
  input               m0_burstcount_ready,
  output     [7:0]    m0_burstcount_payload,
  output              m0_writedata_valid,
  input               m0_writedata_ready,
  output     [63:0]   m0_writedata_payload,
  output              m0_address_valid,
  input               m0_address_ready,
  output     [25:0]   m0_address_payload,
  output              m0_read_valid,
  input               m0_read_ready,
  output              m0_read_payload,
  output              m0_write_valid,
  input               m0_write_ready,
  output              m0_write_payload,
  output              m0_byteenable_valid,
  input               m0_byteenable_ready,
  output     [7:0]    m0_byteenable_payload
);
  wire                m2s_waitrequest_io_push_ready;
  wire                m2s_waitrequest_io_pop_valid;
  wire                m2s_waitrequest_io_pop_payload;
  wire       [1:0]    m2s_waitrequest_io_pushOccupancy;
  wire       [1:0]    m2s_waitrequest_io_popOccupancy;
  wire                m2s_readdata_io_push_ready;
  wire                m2s_readdata_io_pop_valid;
  wire       [63:0]   m2s_readdata_io_pop_payload;
  wire       [1:0]    m2s_readdata_io_pushOccupancy;
  wire       [1:0]    m2s_readdata_io_popOccupancy;
  wire                m2s_readdatavalid_io_push_ready;
  wire                m2s_readdatavalid_io_pop_valid;
  wire                m2s_readdatavalid_io_pop_payload;
  wire       [1:0]    m2s_readdatavalid_io_pushOccupancy;
  wire       [1:0]    m2s_readdatavalid_io_popOccupancy;
  wire                s2m_burstbegin_io_push_ready;
  wire                s2m_burstbegin_io_pop_valid;
  wire                s2m_burstbegin_io_pop_payload;
  wire       [1:0]    s2m_burstbegin_io_pushOccupancy;
  wire       [1:0]    s2m_burstbegin_io_popOccupancy;
  wire                s2m_burstcount_io_push_ready;
  wire                s2m_burstcount_io_pop_valid;
  wire       [7:0]    s2m_burstcount_io_pop_payload;
  wire       [1:0]    s2m_burstcount_io_pushOccupancy;
  wire       [1:0]    s2m_burstcount_io_popOccupancy;
  wire                s2m_writedata_io_push_ready;
  wire                s2m_writedata_io_pop_valid;
  wire       [63:0]   s2m_writedata_io_pop_payload;
  wire       [1:0]    s2m_writedata_io_pushOccupancy;
  wire       [1:0]    s2m_writedata_io_popOccupancy;
  wire                s2m_address_io_push_ready;
  wire                s2m_address_io_pop_valid;
  wire       [25:0]   s2m_address_io_pop_payload;
  wire       [1:0]    s2m_address_io_pushOccupancy;
  wire       [1:0]    s2m_address_io_popOccupancy;
  wire                s2m_read_io_push_ready;
  wire                s2m_read_io_pop_valid;
  wire                s2m_read_io_pop_payload;
  wire       [1:0]    s2m_read_io_pushOccupancy;
  wire       [1:0]    s2m_read_io_popOccupancy;
  wire                s2m_write_io_push_ready;
  wire                s2m_write_io_pop_valid;
  wire                s2m_write_io_pop_payload;
  wire       [1:0]    s2m_write_io_pushOccupancy;
  wire       [1:0]    s2m_write_io_popOccupancy;
  wire                s2m_byteenable_io_push_ready;
  wire                s2m_byteenable_io_pop_valid;
  wire       [7:0]    s2m_byteenable_io_pop_payload;
  wire       [1:0]    s2m_byteenable_io_pushOccupancy;
  wire       [1:0]    s2m_byteenable_io_popOccupancy;

  AvalonClockDomainCrossingBridge_StreamFifoCC m2s_waitrequest (
    .io_push_valid       (m0_waitrequest_valid              ), //i
    .io_push_ready       (m2s_waitrequest_io_push_ready     ), //o
    .io_push_payload     (m0_waitrequest_payload            ), //i
    .io_pop_valid        (m2s_waitrequest_io_pop_valid      ), //o
    .io_pop_ready        (s0_waitrequest_ready              ), //i
    .io_pop_payload      (m2s_waitrequest_io_pop_payload    ), //o
    .io_pushOccupancy    (m2s_waitrequest_io_pushOccupancy  ), //o
    .io_popOccupancy     (m2s_waitrequest_io_popOccupancy   ), //o
    .m0_clock            (m0_clock                          ), //i
    .m0_reset            (m0_reset                          ), //i
    .s0_clock            (s0_clock                          ), //i
    .s0_reset            (s0_reset                          )  //i
  );
  AvalonClockDomainCrossingBridge_StreamFifoCC_1 m2s_readdata (
    .io_push_valid       (m0_readdata_valid              ), //i
    .io_push_ready       (m2s_readdata_io_push_ready     ), //o
    .io_push_payload     (m0_readdata_payload            ), //i
    .io_pop_valid        (m2s_readdata_io_pop_valid      ), //o
    .io_pop_ready        (s0_readdata_ready              ), //i
    .io_pop_payload      (m2s_readdata_io_pop_payload    ), //o
    .io_pushOccupancy    (m2s_readdata_io_pushOccupancy  ), //o
    .io_popOccupancy     (m2s_readdata_io_popOccupancy   ), //o
    .m0_clock            (m0_clock                       ), //i
    .m0_reset            (m0_reset                       ), //i
    .s0_clock            (s0_clock                       ), //i
    .s0_reset            (s0_reset                       )  //i
  );
  AvalonClockDomainCrossingBridge_StreamFifoCC m2s_readdatavalid (
    .io_push_valid       (m0_readdatavalid_valid              ), //i
    .io_push_ready       (m2s_readdatavalid_io_push_ready     ), //o
    .io_push_payload     (m0_readdatavalid_payload            ), //i
    .io_pop_valid        (m2s_readdatavalid_io_pop_valid      ), //o
    .io_pop_ready        (s0_readdatavalid_ready              ), //i
    .io_pop_payload      (m2s_readdatavalid_io_pop_payload    ), //o
    .io_pushOccupancy    (m2s_readdatavalid_io_pushOccupancy  ), //o
    .io_popOccupancy     (m2s_readdatavalid_io_popOccupancy   ), //o
    .m0_clock            (m0_clock                            ), //i
    .m0_reset            (m0_reset                            ), //i
    .s0_clock            (s0_clock                            ), //i
    .s0_reset            (s0_reset                            )  //i
  );
  AvalonClockDomainCrossingBridge_StreamFifoCC_3 s2m_burstbegin (
    .io_push_valid       (s0_burstbegin_valid              ), //i
    .io_push_ready       (s2m_burstbegin_io_push_ready     ), //o
    .io_push_payload     (s0_burstbegin_payload            ), //i
    .io_pop_valid        (s2m_burstbegin_io_pop_valid      ), //o
    .io_pop_ready        (m0_burstbegin_ready              ), //i
    .io_pop_payload      (s2m_burstbegin_io_pop_payload    ), //o
    .io_pushOccupancy    (s2m_burstbegin_io_pushOccupancy  ), //o
    .io_popOccupancy     (s2m_burstbegin_io_popOccupancy   ), //o
    .s0_clock            (s0_clock                         ), //i
    .s0_reset            (s0_reset                         ), //i
    .m0_clock            (m0_clock                         ), //i
    .m0_reset            (m0_reset                         )  //i
  );
  AvalonClockDomainCrossingBridge_StreamFifoCC_4 s2m_burstcount (
    .io_push_valid       (s0_burstcount_valid              ), //i
    .io_push_ready       (s2m_burstcount_io_push_ready     ), //o
    .io_push_payload     (s0_burstcount_payload            ), //i
    .io_pop_valid        (s2m_burstcount_io_pop_valid      ), //o
    .io_pop_ready        (m0_burstcount_ready              ), //i
    .io_pop_payload      (s2m_burstcount_io_pop_payload    ), //o
    .io_pushOccupancy    (s2m_burstcount_io_pushOccupancy  ), //o
    .io_popOccupancy     (s2m_burstcount_io_popOccupancy   ), //o
    .s0_clock            (s0_clock                         ), //i
    .s0_reset            (s0_reset                         ), //i
    .m0_clock            (m0_clock                         ), //i
    .m0_reset            (m0_reset                         )  //i
  );
  AvalonClockDomainCrossingBridge_StreamFifoCC_5 s2m_writedata (
    .io_push_valid       (s0_writedata_valid              ), //i
    .io_push_ready       (s2m_writedata_io_push_ready     ), //o
    .io_push_payload     (s0_writedata_payload            ), //i
    .io_pop_valid        (s2m_writedata_io_pop_valid      ), //o
    .io_pop_ready        (m0_writedata_ready              ), //i
    .io_pop_payload      (s2m_writedata_io_pop_payload    ), //o
    .io_pushOccupancy    (s2m_writedata_io_pushOccupancy  ), //o
    .io_popOccupancy     (s2m_writedata_io_popOccupancy   ), //o
    .s0_clock            (s0_clock                        ), //i
    .s0_reset            (s0_reset                        ), //i
    .m0_clock            (m0_clock                        ), //i
    .m0_reset            (m0_reset                        )  //i
  );
  AvalonClockDomainCrossingBridge_StreamFifoCC_6 s2m_address (
    .io_push_valid       (s0_address_valid              ), //i
    .io_push_ready       (s2m_address_io_push_ready     ), //o
    .io_push_payload     (s0_address_payload            ), //i
    .io_pop_valid        (s2m_address_io_pop_valid      ), //o
    .io_pop_ready        (m0_address_ready              ), //i
    .io_pop_payload      (s2m_address_io_pop_payload    ), //o
    .io_pushOccupancy    (s2m_address_io_pushOccupancy  ), //o
    .io_popOccupancy     (s2m_address_io_popOccupancy   ), //o
    .s0_clock            (s0_clock                      ), //i
    .s0_reset            (s0_reset                      ), //i
    .m0_clock            (m0_clock                      ), //i
    .m0_reset            (m0_reset                      )  //i
  );
  AvalonClockDomainCrossingBridge_StreamFifoCC_3 s2m_read (
    .io_push_valid       (s0_read_valid              ), //i
    .io_push_ready       (s2m_read_io_push_ready     ), //o
    .io_push_payload     (s0_read_payload            ), //i
    .io_pop_valid        (s2m_read_io_pop_valid      ), //o
    .io_pop_ready        (m0_read_ready              ), //i
    .io_pop_payload      (s2m_read_io_pop_payload    ), //o
    .io_pushOccupancy    (s2m_read_io_pushOccupancy  ), //o
    .io_popOccupancy     (s2m_read_io_popOccupancy   ), //o
    .s0_clock            (s0_clock                   ), //i
    .s0_reset            (s0_reset                   ), //i
    .m0_clock            (m0_clock                   ), //i
    .m0_reset            (m0_reset                   )  //i
  );
  AvalonClockDomainCrossingBridge_StreamFifoCC_3 s2m_write (
    .io_push_valid       (s0_write_valid              ), //i
    .io_push_ready       (s2m_write_io_push_ready     ), //o
    .io_push_payload     (s0_write_payload            ), //i
    .io_pop_valid        (s2m_write_io_pop_valid      ), //o
    .io_pop_ready        (m0_write_ready              ), //i
    .io_pop_payload      (s2m_write_io_pop_payload    ), //o
    .io_pushOccupancy    (s2m_write_io_pushOccupancy  ), //o
    .io_popOccupancy     (s2m_write_io_popOccupancy   ), //o
    .s0_clock            (s0_clock                    ), //i
    .s0_reset            (s0_reset                    ), //i
    .m0_clock            (m0_clock                    ), //i
    .m0_reset            (m0_reset                    )  //i
  );
  AvalonClockDomainCrossingBridge_StreamFifoCC_9 s2m_byteenable (
    .io_push_valid       (s0_byteenable_valid              ), //i
    .io_push_ready       (s2m_byteenable_io_push_ready     ), //o
    .io_push_payload     (s0_byteenable_payload            ), //i
    .io_pop_valid        (s2m_byteenable_io_pop_valid      ), //o
    .io_pop_ready        (m0_byteenable_ready              ), //i
    .io_pop_payload      (s2m_byteenable_io_pop_payload    ), //o
    .io_pushOccupancy    (s2m_byteenable_io_pushOccupancy  ), //o
    .io_popOccupancy     (s2m_byteenable_io_popOccupancy   ), //o
    .s0_clock            (s0_clock                         ), //i
    .s0_reset            (s0_reset                         ), //i
    .m0_clock            (m0_clock                         ), //i
    .m0_reset            (m0_reset                         )  //i
  );
  assign m0_waitrequest_ready = m2s_waitrequest_io_push_ready;
  assign s0_waitrequest_valid = m2s_waitrequest_io_pop_valid;
  assign s0_waitrequest_payload = m2s_waitrequest_io_pop_payload;
  assign m0_readdata_ready = m2s_readdata_io_push_ready;
  assign s0_readdata_valid = m2s_readdata_io_pop_valid;
  assign s0_readdata_payload = m2s_readdata_io_pop_payload;
  assign m0_readdatavalid_ready = m2s_readdatavalid_io_push_ready;
  assign s0_readdatavalid_valid = m2s_readdatavalid_io_pop_valid;
  assign s0_readdatavalid_payload = m2s_readdatavalid_io_pop_payload;
  assign s0_burstbegin_ready = s2m_burstbegin_io_push_ready;
  assign m0_burstbegin_valid = s2m_burstbegin_io_pop_valid;
  assign m0_burstbegin_payload = s2m_burstbegin_io_pop_payload;
  assign s0_burstcount_ready = s2m_burstcount_io_push_ready;
  assign m0_burstcount_valid = s2m_burstcount_io_pop_valid;
  assign m0_burstcount_payload = s2m_burstcount_io_pop_payload;
  assign s0_writedata_ready = s2m_writedata_io_push_ready;
  assign m0_writedata_valid = s2m_writedata_io_pop_valid;
  assign m0_writedata_payload = s2m_writedata_io_pop_payload;
  assign s0_address_ready = s2m_address_io_push_ready;
  assign m0_address_valid = s2m_address_io_pop_valid;
  assign m0_address_payload = s2m_address_io_pop_payload;
  assign s0_read_ready = s2m_read_io_push_ready;
  assign m0_read_valid = s2m_read_io_pop_valid;
  assign m0_read_payload = s2m_read_io_pop_payload;
  assign s0_write_ready = s2m_write_io_push_ready;
  assign m0_write_valid = s2m_write_io_pop_valid;
  assign m0_write_payload = s2m_write_io_pop_payload;
  assign s0_byteenable_ready = s2m_byteenable_io_push_ready;
  assign m0_byteenable_valid = s2m_byteenable_io_pop_valid;
  assign m0_byteenable_payload = s2m_byteenable_io_pop_payload;

endmodule

module AvalonClockDomainCrossingBridge_StreamFifoCC_9 (
  input               io_push_valid,
  output              io_push_ready,
  input      [7:0]    io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [7:0]    io_pop_payload,
  output     [1:0]    io_pushOccupancy,
  output     [1:0]    io_popOccupancy,
  input               s0_clock,
  input               s0_reset,
  input               m0_clock,
  input               m0_reset
);
  reg        [7:0]    _zz_ram_port1;
  wire       [1:0]    popToPushGray_buffercc_io_dataOut;
  wire       [1:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [1:0]    _zz_pushCC_pushPtrGray;
  wire       [0:0]    _zz_ram_port;
  wire       [1:0]    _zz_popCC_popPtrGray;
  wire       [0:0]    _zz_ram_port_1;
  wire                _zz_ram_port_2;
  wire       [0:0]    _zz_io_pop_payload_1;
  wire                _zz_io_pop_payload_2;
  reg                 _zz_1;
  wire       [1:0]    popToPushGray;
  wire       [1:0]    pushToPopGray;
  reg        [1:0]    pushCC_pushPtr;
  wire       [1:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [1:0]    pushCC_pushPtrGray;
  wire       [1:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                io_push_fire_1;
  wire                _zz_io_pushOccupancy;
  reg        [1:0]    popCC_popPtr;
  wire       [1:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [1:0]    popCC_popPtrGray;
  wire       [1:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [1:0]    _zz_io_pop_payload;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  reg [7:0] ram [0:1];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[0:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz_io_pop_payload_1 = _zz_io_pop_payload[0:0];
  assign _zz_io_pop_payload_2 = 1'b1;
  always @(posedge s0_clock) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= io_push_payload;
    end
  end

  always @(posedge m0_clock) begin
    if(_zz_io_pop_payload_2) begin
      _zz_ram_port1 <= ram[_zz_io_pop_payload_1];
    end
  end

  AvalonClockDomainCrossingBridge_BufferCC_1 popToPushGray_buffercc (
    .io_dataIn     (popToPushGray                      ), //i
    .io_dataOut    (popToPushGray_buffercc_io_dataOut  ), //o
    .s0_clock      (s0_clock                           ), //i
    .s0_reset      (s0_reset                           )  //i
  );
  AvalonClockDomainCrossingBridge_BufferCC pushToPopGray_buffercc (
    .io_dataIn     (pushToPopGray                      ), //i
    .io_dataOut    (pushToPopGray_buffercc_io_dataOut  ), //o
    .m0_clock      (m0_clock                           ), //i
    .m0_reset      (m0_reset                           )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire_1) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 2'b01);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[1 : 0] == (~ pushCC_popPtrGray[1 : 0])) && 1'b1);
  assign io_push_ready = (! pushCC_full);
  assign io_push_fire_1 = (io_push_valid && io_push_ready);
  assign _zz_io_pushOccupancy = pushCC_popPtrGray[1];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy,(pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy)});
  assign popCC_popPtrPlus = (popCC_popPtr + 2'b01);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign io_pop_fire_1 = (io_pop_valid && io_pop_ready);
  assign _zz_io_pop_payload = (io_pop_fire_1 ? popCC_popPtrPlus : popCC_popPtr);
  assign io_pop_payload = _zz_ram_port1;
  assign io_pop_fire_2 = (io_pop_valid && io_pop_ready);
  assign _zz_io_popOccupancy = popCC_pushPtrGray[1];
  assign io_popOccupancy = ({_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @(posedge s0_clock or posedge s0_reset) begin
    if(s0_reset) begin
      pushCC_pushPtr <= 2'b00;
      pushCC_pushPtrGray <= 2'b00;
    end else begin
      if(io_push_fire) begin
        pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
      end
      if(io_push_fire_1) begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
    end
  end

  always @(posedge m0_clock or posedge m0_reset) begin
    if(m0_reset) begin
      popCC_popPtr <= 2'b00;
      popCC_popPtrGray <= 2'b00;
    end else begin
      if(io_pop_fire) begin
        popCC_popPtrGray <= (_zz_popCC_popPtrGray ^ popCC_popPtrPlus);
      end
      if(io_pop_fire_2) begin
        popCC_popPtr <= popCC_popPtrPlus;
      end
    end
  end


endmodule

//AvalonClockDomainCrossingBridge_StreamFifoCC_3 replaced by AvalonClockDomainCrossingBridge_StreamFifoCC_3

//AvalonClockDomainCrossingBridge_StreamFifoCC_3 replaced by AvalonClockDomainCrossingBridge_StreamFifoCC_3

module AvalonClockDomainCrossingBridge_StreamFifoCC_6 (
  input               io_push_valid,
  output              io_push_ready,
  input      [25:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [25:0]   io_pop_payload,
  output     [1:0]    io_pushOccupancy,
  output     [1:0]    io_popOccupancy,
  input               s0_clock,
  input               s0_reset,
  input               m0_clock,
  input               m0_reset
);
  reg        [25:0]   _zz_ram_port1;
  wire       [1:0]    popToPushGray_buffercc_io_dataOut;
  wire       [1:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [1:0]    _zz_pushCC_pushPtrGray;
  wire       [0:0]    _zz_ram_port;
  wire       [25:0]   _zz_ram_port_1;
  wire       [1:0]    _zz_popCC_popPtrGray;
  wire       [0:0]    _zz_ram_port_2;
  wire                _zz_ram_port_3;
  wire       [0:0]    _zz_io_pop_payload_1;
  wire                _zz_io_pop_payload_2;
  reg                 _zz_1;
  wire       [1:0]    popToPushGray;
  wire       [1:0]    pushToPopGray;
  reg        [1:0]    pushCC_pushPtr;
  wire       [1:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [1:0]    pushCC_pushPtrGray;
  wire       [1:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                io_push_fire_1;
  wire                _zz_io_pushOccupancy;
  reg        [1:0]    popCC_popPtr;
  wire       [1:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [1:0]    popCC_popPtrGray;
  wire       [1:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [1:0]    _zz_io_pop_payload;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  reg [25:0] ram [0:1];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[0:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz_io_pop_payload_1 = _zz_io_pop_payload[0:0];
  assign _zz_ram_port_1 = io_push_payload;
  assign _zz_io_pop_payload_2 = 1'b1;
  always @(posedge s0_clock) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= _zz_ram_port_1;
    end
  end

  always @(posedge m0_clock) begin
    if(_zz_io_pop_payload_2) begin
      _zz_ram_port1 <= ram[_zz_io_pop_payload_1];
    end
  end

  AvalonClockDomainCrossingBridge_BufferCC_1 popToPushGray_buffercc (
    .io_dataIn     (popToPushGray                      ), //i
    .io_dataOut    (popToPushGray_buffercc_io_dataOut  ), //o
    .s0_clock      (s0_clock                           ), //i
    .s0_reset      (s0_reset                           )  //i
  );
  AvalonClockDomainCrossingBridge_BufferCC pushToPopGray_buffercc (
    .io_dataIn     (pushToPopGray                      ), //i
    .io_dataOut    (pushToPopGray_buffercc_io_dataOut  ), //o
    .m0_clock      (m0_clock                           ), //i
    .m0_reset      (m0_reset                           )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire_1) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 2'b01);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[1 : 0] == (~ pushCC_popPtrGray[1 : 0])) && 1'b1);
  assign io_push_ready = (! pushCC_full);
  assign io_push_fire_1 = (io_push_valid && io_push_ready);
  assign _zz_io_pushOccupancy = pushCC_popPtrGray[1];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy,(pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy)});
  assign popCC_popPtrPlus = (popCC_popPtr + 2'b01);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign io_pop_fire_1 = (io_pop_valid && io_pop_ready);
  assign _zz_io_pop_payload = (io_pop_fire_1 ? popCC_popPtrPlus : popCC_popPtr);
  assign io_pop_payload = _zz_ram_port1;
  assign io_pop_fire_2 = (io_pop_valid && io_pop_ready);
  assign _zz_io_popOccupancy = popCC_pushPtrGray[1];
  assign io_popOccupancy = ({_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @(posedge s0_clock or posedge s0_reset) begin
    if(s0_reset) begin
      pushCC_pushPtr <= 2'b00;
      pushCC_pushPtrGray <= 2'b00;
    end else begin
      if(io_push_fire) begin
        pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
      end
      if(io_push_fire_1) begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
    end
  end

  always @(posedge m0_clock or posedge m0_reset) begin
    if(m0_reset) begin
      popCC_popPtr <= 2'b00;
      popCC_popPtrGray <= 2'b00;
    end else begin
      if(io_pop_fire) begin
        popCC_popPtrGray <= (_zz_popCC_popPtrGray ^ popCC_popPtrPlus);
      end
      if(io_pop_fire_2) begin
        popCC_popPtr <= popCC_popPtrPlus;
      end
    end
  end


endmodule

module AvalonClockDomainCrossingBridge_StreamFifoCC_5 (
  input               io_push_valid,
  output              io_push_ready,
  input      [63:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [63:0]   io_pop_payload,
  output     [1:0]    io_pushOccupancy,
  output     [1:0]    io_popOccupancy,
  input               s0_clock,
  input               s0_reset,
  input               m0_clock,
  input               m0_reset
);
  reg        [63:0]   _zz_ram_port1;
  wire       [1:0]    popToPushGray_buffercc_io_dataOut;
  wire       [1:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [1:0]    _zz_pushCC_pushPtrGray;
  wire       [0:0]    _zz_ram_port;
  wire       [1:0]    _zz_popCC_popPtrGray;
  wire       [0:0]    _zz_ram_port_1;
  wire                _zz_ram_port_2;
  wire       [0:0]    _zz_io_pop_payload_1;
  wire                _zz_io_pop_payload_2;
  reg                 _zz_1;
  wire       [1:0]    popToPushGray;
  wire       [1:0]    pushToPopGray;
  reg        [1:0]    pushCC_pushPtr;
  wire       [1:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [1:0]    pushCC_pushPtrGray;
  wire       [1:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                io_push_fire_1;
  wire                _zz_io_pushOccupancy;
  reg        [1:0]    popCC_popPtr;
  wire       [1:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [1:0]    popCC_popPtrGray;
  wire       [1:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [1:0]    _zz_io_pop_payload;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  reg [63:0] ram [0:1];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[0:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz_io_pop_payload_1 = _zz_io_pop_payload[0:0];
  assign _zz_io_pop_payload_2 = 1'b1;
  always @(posedge s0_clock) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= io_push_payload;
    end
  end

  always @(posedge m0_clock) begin
    if(_zz_io_pop_payload_2) begin
      _zz_ram_port1 <= ram[_zz_io_pop_payload_1];
    end
  end

  AvalonClockDomainCrossingBridge_BufferCC_1 popToPushGray_buffercc (
    .io_dataIn     (popToPushGray                      ), //i
    .io_dataOut    (popToPushGray_buffercc_io_dataOut  ), //o
    .s0_clock      (s0_clock                           ), //i
    .s0_reset      (s0_reset                           )  //i
  );
  AvalonClockDomainCrossingBridge_BufferCC pushToPopGray_buffercc (
    .io_dataIn     (pushToPopGray                      ), //i
    .io_dataOut    (pushToPopGray_buffercc_io_dataOut  ), //o
    .m0_clock      (m0_clock                           ), //i
    .m0_reset      (m0_reset                           )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire_1) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 2'b01);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[1 : 0] == (~ pushCC_popPtrGray[1 : 0])) && 1'b1);
  assign io_push_ready = (! pushCC_full);
  assign io_push_fire_1 = (io_push_valid && io_push_ready);
  assign _zz_io_pushOccupancy = pushCC_popPtrGray[1];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy,(pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy)});
  assign popCC_popPtrPlus = (popCC_popPtr + 2'b01);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign io_pop_fire_1 = (io_pop_valid && io_pop_ready);
  assign _zz_io_pop_payload = (io_pop_fire_1 ? popCC_popPtrPlus : popCC_popPtr);
  assign io_pop_payload = _zz_ram_port1;
  assign io_pop_fire_2 = (io_pop_valid && io_pop_ready);
  assign _zz_io_popOccupancy = popCC_pushPtrGray[1];
  assign io_popOccupancy = ({_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @(posedge s0_clock or posedge s0_reset) begin
    if(s0_reset) begin
      pushCC_pushPtr <= 2'b00;
      pushCC_pushPtrGray <= 2'b00;
    end else begin
      if(io_push_fire) begin
        pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
      end
      if(io_push_fire_1) begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
    end
  end

  always @(posedge m0_clock or posedge m0_reset) begin
    if(m0_reset) begin
      popCC_popPtr <= 2'b00;
      popCC_popPtrGray <= 2'b00;
    end else begin
      if(io_pop_fire) begin
        popCC_popPtrGray <= (_zz_popCC_popPtrGray ^ popCC_popPtrPlus);
      end
      if(io_pop_fire_2) begin
        popCC_popPtr <= popCC_popPtrPlus;
      end
    end
  end


endmodule

module AvalonClockDomainCrossingBridge_StreamFifoCC_4 (
  input               io_push_valid,
  output              io_push_ready,
  input      [7:0]    io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [7:0]    io_pop_payload,
  output     [1:0]    io_pushOccupancy,
  output     [1:0]    io_popOccupancy,
  input               s0_clock,
  input               s0_reset,
  input               m0_clock,
  input               m0_reset
);
  reg        [7:0]    _zz_ram_port1;
  wire       [1:0]    popToPushGray_buffercc_io_dataOut;
  wire       [1:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [1:0]    _zz_pushCC_pushPtrGray;
  wire       [0:0]    _zz_ram_port;
  wire       [7:0]    _zz_ram_port_1;
  wire       [1:0]    _zz_popCC_popPtrGray;
  wire       [0:0]    _zz_ram_port_2;
  wire                _zz_ram_port_3;
  wire       [0:0]    _zz_io_pop_payload_1;
  wire                _zz_io_pop_payload_2;
  reg                 _zz_1;
  wire       [1:0]    popToPushGray;
  wire       [1:0]    pushToPopGray;
  reg        [1:0]    pushCC_pushPtr;
  wire       [1:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [1:0]    pushCC_pushPtrGray;
  wire       [1:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                io_push_fire_1;
  wire                _zz_io_pushOccupancy;
  reg        [1:0]    popCC_popPtr;
  wire       [1:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [1:0]    popCC_popPtrGray;
  wire       [1:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [1:0]    _zz_io_pop_payload;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  reg [7:0] ram [0:1];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[0:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz_io_pop_payload_1 = _zz_io_pop_payload[0:0];
  assign _zz_ram_port_1 = io_push_payload;
  assign _zz_io_pop_payload_2 = 1'b1;
  always @(posedge s0_clock) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= _zz_ram_port_1;
    end
  end

  always @(posedge m0_clock) begin
    if(_zz_io_pop_payload_2) begin
      _zz_ram_port1 <= ram[_zz_io_pop_payload_1];
    end
  end

  AvalonClockDomainCrossingBridge_BufferCC_1 popToPushGray_buffercc (
    .io_dataIn     (popToPushGray                      ), //i
    .io_dataOut    (popToPushGray_buffercc_io_dataOut  ), //o
    .s0_clock      (s0_clock                           ), //i
    .s0_reset      (s0_reset                           )  //i
  );
  AvalonClockDomainCrossingBridge_BufferCC pushToPopGray_buffercc (
    .io_dataIn     (pushToPopGray                      ), //i
    .io_dataOut    (pushToPopGray_buffercc_io_dataOut  ), //o
    .m0_clock      (m0_clock                           ), //i
    .m0_reset      (m0_reset                           )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire_1) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 2'b01);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[1 : 0] == (~ pushCC_popPtrGray[1 : 0])) && 1'b1);
  assign io_push_ready = (! pushCC_full);
  assign io_push_fire_1 = (io_push_valid && io_push_ready);
  assign _zz_io_pushOccupancy = pushCC_popPtrGray[1];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy,(pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy)});
  assign popCC_popPtrPlus = (popCC_popPtr + 2'b01);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign io_pop_fire_1 = (io_pop_valid && io_pop_ready);
  assign _zz_io_pop_payload = (io_pop_fire_1 ? popCC_popPtrPlus : popCC_popPtr);
  assign io_pop_payload = _zz_ram_port1;
  assign io_pop_fire_2 = (io_pop_valid && io_pop_ready);
  assign _zz_io_popOccupancy = popCC_pushPtrGray[1];
  assign io_popOccupancy = ({_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @(posedge s0_clock or posedge s0_reset) begin
    if(s0_reset) begin
      pushCC_pushPtr <= 2'b00;
      pushCC_pushPtrGray <= 2'b00;
    end else begin
      if(io_push_fire) begin
        pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
      end
      if(io_push_fire_1) begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
    end
  end

  always @(posedge m0_clock or posedge m0_reset) begin
    if(m0_reset) begin
      popCC_popPtr <= 2'b00;
      popCC_popPtrGray <= 2'b00;
    end else begin
      if(io_pop_fire) begin
        popCC_popPtrGray <= (_zz_popCC_popPtrGray ^ popCC_popPtrPlus);
      end
      if(io_pop_fire_2) begin
        popCC_popPtr <= popCC_popPtrPlus;
      end
    end
  end


endmodule

module AvalonClockDomainCrossingBridge_StreamFifoCC_3 (
  input               io_push_valid,
  output              io_push_ready,
  input               io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output              io_pop_payload,
  output     [1:0]    io_pushOccupancy,
  output     [1:0]    io_popOccupancy,
  input               s0_clock,
  input               s0_reset,
  input               m0_clock,
  input               m0_reset
);
  reg        [0:0]    _zz_ram_port1;
  wire       [1:0]    popToPushGray_buffercc_io_dataOut;
  wire       [1:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [1:0]    _zz_pushCC_pushPtrGray;
  wire       [0:0]    _zz_ram_port;
  wire       [0:0]    _zz_ram_port_1;
  wire       [1:0]    _zz_popCC_popPtrGray;
  wire       [0:0]    _zz_ram_port_2;
  wire                _zz_ram_port_3;
  wire       [0:0]    _zz_io_pop_payload_1;
  wire                _zz_io_pop_payload_2;
  reg                 _zz_1;
  wire       [1:0]    popToPushGray;
  wire       [1:0]    pushToPopGray;
  reg        [1:0]    pushCC_pushPtr;
  wire       [1:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [1:0]    pushCC_pushPtrGray;
  wire       [1:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                io_push_fire_1;
  wire                _zz_io_pushOccupancy;
  reg        [1:0]    popCC_popPtr;
  wire       [1:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [1:0]    popCC_popPtrGray;
  wire       [1:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [1:0]    _zz_io_pop_payload;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  reg [0:0] ram [0:1];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[0:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz_io_pop_payload_1 = _zz_io_pop_payload[0:0];
  assign _zz_ram_port_1 = io_push_payload;
  assign _zz_io_pop_payload_2 = 1'b1;
  always @(posedge s0_clock) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= _zz_ram_port_1;
    end
  end

  always @(posedge m0_clock) begin
    if(_zz_io_pop_payload_2) begin
      _zz_ram_port1 <= ram[_zz_io_pop_payload_1];
    end
  end

  AvalonClockDomainCrossingBridge_BufferCC_1 popToPushGray_buffercc (
    .io_dataIn     (popToPushGray                      ), //i
    .io_dataOut    (popToPushGray_buffercc_io_dataOut  ), //o
    .s0_clock      (s0_clock                           ), //i
    .s0_reset      (s0_reset                           )  //i
  );
  AvalonClockDomainCrossingBridge_BufferCC pushToPopGray_buffercc (
    .io_dataIn     (pushToPopGray                      ), //i
    .io_dataOut    (pushToPopGray_buffercc_io_dataOut  ), //o
    .m0_clock      (m0_clock                           ), //i
    .m0_reset      (m0_reset                           )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire_1) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 2'b01);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[1 : 0] == (~ pushCC_popPtrGray[1 : 0])) && 1'b1);
  assign io_push_ready = (! pushCC_full);
  assign io_push_fire_1 = (io_push_valid && io_push_ready);
  assign _zz_io_pushOccupancy = pushCC_popPtrGray[1];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy,(pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy)});
  assign popCC_popPtrPlus = (popCC_popPtr + 2'b01);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign io_pop_fire_1 = (io_pop_valid && io_pop_ready);
  assign _zz_io_pop_payload = (io_pop_fire_1 ? popCC_popPtrPlus : popCC_popPtr);
  assign io_pop_payload = _zz_ram_port1[0];
  assign io_pop_fire_2 = (io_pop_valid && io_pop_ready);
  assign _zz_io_popOccupancy = popCC_pushPtrGray[1];
  assign io_popOccupancy = ({_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @(posedge s0_clock or posedge s0_reset) begin
    if(s0_reset) begin
      pushCC_pushPtr <= 2'b00;
      pushCC_pushPtrGray <= 2'b00;
    end else begin
      if(io_push_fire) begin
        pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
      end
      if(io_push_fire_1) begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
    end
  end

  always @(posedge m0_clock or posedge m0_reset) begin
    if(m0_reset) begin
      popCC_popPtr <= 2'b00;
      popCC_popPtrGray <= 2'b00;
    end else begin
      if(io_pop_fire) begin
        popCC_popPtrGray <= (_zz_popCC_popPtrGray ^ popCC_popPtrPlus);
      end
      if(io_pop_fire_2) begin
        popCC_popPtr <= popCC_popPtrPlus;
      end
    end
  end


endmodule

//AvalonClockDomainCrossingBridge_StreamFifoCC replaced by AvalonClockDomainCrossingBridge_StreamFifoCC

module AvalonClockDomainCrossingBridge_StreamFifoCC_1 (
  input               io_push_valid,
  output              io_push_ready,
  input      [63:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [63:0]   io_pop_payload,
  output     [1:0]    io_pushOccupancy,
  output     [1:0]    io_popOccupancy,
  input               m0_clock,
  input               m0_reset,
  input               s0_clock,
  input               s0_reset
);
  reg        [63:0]   _zz_ram_port1;
  wire       [1:0]    popToPushGray_buffercc_io_dataOut;
  wire       [1:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [1:0]    _zz_pushCC_pushPtrGray;
  wire       [0:0]    _zz_ram_port;
  wire       [1:0]    _zz_popCC_popPtrGray;
  wire       [0:0]    _zz_ram_port_1;
  wire                _zz_ram_port_2;
  wire       [0:0]    _zz_io_pop_payload_1;
  wire                _zz_io_pop_payload_2;
  reg                 _zz_1;
  wire       [1:0]    popToPushGray;
  wire       [1:0]    pushToPopGray;
  reg        [1:0]    pushCC_pushPtr;
  wire       [1:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [1:0]    pushCC_pushPtrGray;
  wire       [1:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                io_push_fire_1;
  wire                _zz_io_pushOccupancy;
  reg        [1:0]    popCC_popPtr;
  wire       [1:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [1:0]    popCC_popPtrGray;
  wire       [1:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [1:0]    _zz_io_pop_payload;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  reg [63:0] ram [0:1];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[0:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz_io_pop_payload_1 = _zz_io_pop_payload[0:0];
  assign _zz_io_pop_payload_2 = 1'b1;
  always @(posedge m0_clock) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= io_push_payload;
    end
  end

  always @(posedge s0_clock) begin
    if(_zz_io_pop_payload_2) begin
      _zz_ram_port1 <= ram[_zz_io_pop_payload_1];
    end
  end

  AvalonClockDomainCrossingBridge_BufferCC popToPushGray_buffercc (
    .io_dataIn     (popToPushGray                      ), //i
    .io_dataOut    (popToPushGray_buffercc_io_dataOut  ), //o
    .m0_clock      (m0_clock                           ), //i
    .m0_reset      (m0_reset                           )  //i
  );
  AvalonClockDomainCrossingBridge_BufferCC_1 pushToPopGray_buffercc (
    .io_dataIn     (pushToPopGray                      ), //i
    .io_dataOut    (pushToPopGray_buffercc_io_dataOut  ), //o
    .s0_clock      (s0_clock                           ), //i
    .s0_reset      (s0_reset                           )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire_1) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 2'b01);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[1 : 0] == (~ pushCC_popPtrGray[1 : 0])) && 1'b1);
  assign io_push_ready = (! pushCC_full);
  assign io_push_fire_1 = (io_push_valid && io_push_ready);
  assign _zz_io_pushOccupancy = pushCC_popPtrGray[1];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy,(pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy)});
  assign popCC_popPtrPlus = (popCC_popPtr + 2'b01);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign io_pop_fire_1 = (io_pop_valid && io_pop_ready);
  assign _zz_io_pop_payload = (io_pop_fire_1 ? popCC_popPtrPlus : popCC_popPtr);
  assign io_pop_payload = _zz_ram_port1;
  assign io_pop_fire_2 = (io_pop_valid && io_pop_ready);
  assign _zz_io_popOccupancy = popCC_pushPtrGray[1];
  assign io_popOccupancy = ({_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @(posedge m0_clock or posedge m0_reset) begin
    if(m0_reset) begin
      pushCC_pushPtr <= 2'b00;
      pushCC_pushPtrGray <= 2'b00;
    end else begin
      if(io_push_fire) begin
        pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
      end
      if(io_push_fire_1) begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
    end
  end

  always @(posedge s0_clock or posedge s0_reset) begin
    if(s0_reset) begin
      popCC_popPtr <= 2'b00;
      popCC_popPtrGray <= 2'b00;
    end else begin
      if(io_pop_fire) begin
        popCC_popPtrGray <= (_zz_popCC_popPtrGray ^ popCC_popPtrPlus);
      end
      if(io_pop_fire_2) begin
        popCC_popPtr <= popCC_popPtrPlus;
      end
    end
  end


endmodule

module AvalonClockDomainCrossingBridge_StreamFifoCC (
  input               io_push_valid,
  output              io_push_ready,
  input               io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output              io_pop_payload,
  output     [1:0]    io_pushOccupancy,
  output     [1:0]    io_popOccupancy,
  input               m0_clock,
  input               m0_reset,
  input               s0_clock,
  input               s0_reset
);
  reg        [0:0]    _zz_ram_port1;
  wire       [1:0]    popToPushGray_buffercc_io_dataOut;
  wire       [1:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [1:0]    _zz_pushCC_pushPtrGray;
  wire       [0:0]    _zz_ram_port;
  wire       [0:0]    _zz_ram_port_1;
  wire       [1:0]    _zz_popCC_popPtrGray;
  wire       [0:0]    _zz_ram_port_2;
  wire                _zz_ram_port_3;
  wire       [0:0]    _zz_io_pop_payload_1;
  wire                _zz_io_pop_payload_2;
  reg                 _zz_1;
  wire       [1:0]    popToPushGray;
  wire       [1:0]    pushToPopGray;
  reg        [1:0]    pushCC_pushPtr;
  wire       [1:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [1:0]    pushCC_pushPtrGray;
  wire       [1:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                io_push_fire_1;
  wire                _zz_io_pushOccupancy;
  reg        [1:0]    popCC_popPtr;
  wire       [1:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [1:0]    popCC_popPtrGray;
  wire       [1:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [1:0]    _zz_io_pop_payload;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  reg [0:0] ram [0:1];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[0:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz_io_pop_payload_1 = _zz_io_pop_payload[0:0];
  assign _zz_ram_port_1 = io_push_payload;
  assign _zz_io_pop_payload_2 = 1'b1;
  always @(posedge m0_clock) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= _zz_ram_port_1;
    end
  end

  always @(posedge s0_clock) begin
    if(_zz_io_pop_payload_2) begin
      _zz_ram_port1 <= ram[_zz_io_pop_payload_1];
    end
  end

  AvalonClockDomainCrossingBridge_BufferCC popToPushGray_buffercc (
    .io_dataIn     (popToPushGray                      ), //i
    .io_dataOut    (popToPushGray_buffercc_io_dataOut  ), //o
    .m0_clock      (m0_clock                           ), //i
    .m0_reset      (m0_reset                           )  //i
  );
  AvalonClockDomainCrossingBridge_BufferCC_1 pushToPopGray_buffercc (
    .io_dataIn     (pushToPopGray                      ), //i
    .io_dataOut    (pushToPopGray_buffercc_io_dataOut  ), //o
    .s0_clock      (s0_clock                           ), //i
    .s0_reset      (s0_reset                           )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire_1) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 2'b01);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[1 : 0] == (~ pushCC_popPtrGray[1 : 0])) && 1'b1);
  assign io_push_ready = (! pushCC_full);
  assign io_push_fire_1 = (io_push_valid && io_push_ready);
  assign _zz_io_pushOccupancy = pushCC_popPtrGray[1];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy,(pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy)});
  assign popCC_popPtrPlus = (popCC_popPtr + 2'b01);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign io_pop_fire_1 = (io_pop_valid && io_pop_ready);
  assign _zz_io_pop_payload = (io_pop_fire_1 ? popCC_popPtrPlus : popCC_popPtr);
  assign io_pop_payload = _zz_ram_port1[0];
  assign io_pop_fire_2 = (io_pop_valid && io_pop_ready);
  assign _zz_io_popOccupancy = popCC_pushPtrGray[1];
  assign io_popOccupancy = ({_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @(posedge m0_clock or posedge m0_reset) begin
    if(m0_reset) begin
      pushCC_pushPtr <= 2'b00;
      pushCC_pushPtrGray <= 2'b00;
    end else begin
      if(io_push_fire) begin
        pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
      end
      if(io_push_fire_1) begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
    end
  end

  always @(posedge s0_clock or posedge s0_reset) begin
    if(s0_reset) begin
      popCC_popPtr <= 2'b00;
      popCC_popPtrGray <= 2'b00;
    end else begin
      if(io_pop_fire) begin
        popCC_popPtrGray <= (_zz_popCC_popPtrGray ^ popCC_popPtrPlus);
      end
      if(io_pop_fire_2) begin
        popCC_popPtr <= popCC_popPtrPlus;
      end
    end
  end


endmodule

//AvalonClockDomainCrossingBridge_BufferCC replaced by AvalonClockDomainCrossingBridge_BufferCC

//AvalonClockDomainCrossingBridge_BufferCC_1 replaced by AvalonClockDomainCrossingBridge_BufferCC_1

//AvalonClockDomainCrossingBridge_BufferCC replaced by AvalonClockDomainCrossingBridge_BufferCC

//AvalonClockDomainCrossingBridge_BufferCC_1 replaced by AvalonClockDomainCrossingBridge_BufferCC_1

//AvalonClockDomainCrossingBridge_BufferCC replaced by AvalonClockDomainCrossingBridge_BufferCC

//AvalonClockDomainCrossingBridge_BufferCC_1 replaced by AvalonClockDomainCrossingBridge_BufferCC_1

//AvalonClockDomainCrossingBridge_BufferCC replaced by AvalonClockDomainCrossingBridge_BufferCC

//AvalonClockDomainCrossingBridge_BufferCC_1 replaced by AvalonClockDomainCrossingBridge_BufferCC_1

//AvalonClockDomainCrossingBridge_BufferCC replaced by AvalonClockDomainCrossingBridge_BufferCC

//AvalonClockDomainCrossingBridge_BufferCC_1 replaced by AvalonClockDomainCrossingBridge_BufferCC_1

//AvalonClockDomainCrossingBridge_BufferCC replaced by AvalonClockDomainCrossingBridge_BufferCC

//AvalonClockDomainCrossingBridge_BufferCC_1 replaced by AvalonClockDomainCrossingBridge_BufferCC_1

//AvalonClockDomainCrossingBridge_BufferCC replaced by AvalonClockDomainCrossingBridge_BufferCC

//AvalonClockDomainCrossingBridge_BufferCC_1 replaced by AvalonClockDomainCrossingBridge_BufferCC_1

//AvalonClockDomainCrossingBridge_BufferCC_1 replaced by AvalonClockDomainCrossingBridge_BufferCC_1

//AvalonClockDomainCrossingBridge_BufferCC replaced by AvalonClockDomainCrossingBridge_BufferCC

//AvalonClockDomainCrossingBridge_BufferCC_1 replaced by AvalonClockDomainCrossingBridge_BufferCC_1

//AvalonClockDomainCrossingBridge_BufferCC replaced by AvalonClockDomainCrossingBridge_BufferCC

module AvalonClockDomainCrossingBridge_BufferCC_1 (
  input      [1:0]    io_dataIn,
  output     [1:0]    io_dataOut,
  input               s0_clock,
  input               s0_reset
);
  (* async_reg = "true" *) reg        [1:0]    buffers_0;
  (* async_reg = "true" *) reg        [1:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge s0_clock or posedge s0_reset) begin
    if(s0_reset) begin
      buffers_0 <= 2'b00;
      buffers_1 <= 2'b00;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module AvalonClockDomainCrossingBridge_BufferCC (
  input      [1:0]    io_dataIn,
  output     [1:0]    io_dataOut,
  input               m0_clock,
  input               m0_reset
);
  (* async_reg = "true" *) reg        [1:0]    buffers_0;
  (* async_reg = "true" *) reg        [1:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge m0_clock or posedge m0_reset) begin
    if(m0_reset) begin
      buffers_0 <= 2'b00;
      buffers_1 <= 2'b00;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule
