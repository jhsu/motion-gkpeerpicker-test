class Listener
  def start
    port = 0
    queue = Dispatch::Queue.concurrent(:default)
    listening = GCDAsyncSocket.alloc.initWithDelegate(self, delegateQueue:queue)
    error = Pointer.new
    if !listening.acceptOnPort(port, error:error)
      NSLog("Could not listen #{error}")
    end
  end

  def socket(sender, didAcceptNewSocket:socket)
    NSLog("Accept connection")
  end

  # - (void)socket:(GCDAsyncSocket *)sender didAcceptNewSocket:(GCDAsyncSocket *)newSocket
  # {
  #     // The "sender" parameter is the listenSocket we created.
  #     // The "newSocket" is a new instance of GCDAsyncSocket.
  #     // It represents the accepted incoming client connection.
  # 
  #     // Do server stuff with newSocket...
  # }

end
