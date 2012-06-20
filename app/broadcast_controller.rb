class BroadcastController < UIViewController
  attr_accessor :listener

  def loadView
    NSLog("loadView")
    self.view = UIView.alloc.initWithFrame(UIScreen.mainScreen.applicationFrame)
  end

  def viewDidLoad
    NSLog("viewDidLoad")
  end

  def viewWillAppear(animated)
    NSLog("viewWillLoad")
    port = 4567
    @listener = NSNetService.alloc.initWithDomain("", type:"_discovery._tcp.", name:"Broadcaster", port:port)
    @listener.delegate = self
    @listener.publish
  end

  # def viewWillDisappear(animated)
  #   super animated
  #   @listener.stop
  #   @listener.delegate = nil
  #   @listener = nil
  # end

  # NSNetServiceDelegateo

  # netServiceWillPublish:
  # netService:didNotPublish:
  # netServiceDidPublish:
  # netServiceWillResolve:
  # netService:didNotResolve:
  # netServiceDidResolveAddress:
  # netService:didUpdateTXTRecordData:
  # netServiceDidStop:

  def netServiceWillPublish(service)
    NSLog("netServiceWillPublish:")
  end

  def netService(service, didNotPublish:error)
    NSLog("netService:didNotPublish:")
  end

  def netServiceDidPublish(service)
    NSLog("netServiceDidPublish: #{service.domain} #{service.type} #{service.name}")
  end

  def netServiceWillResolve(service)
    NSLog("netServiceWillResolve:")
  end

  def netService(service, didNotResolve:error)
    NSLog("netService:didNotResolve:")
  end

  def netServiceDidResolveAddress(service)
    NSLog("netServiceDidResolveAddress:")
  end

  def netService(service, didUpdateTXTRecordData:data)
    NSLog("netService:didUpdateTXTRecordData:")
  end

  def netServiceDidStop(service)
    NSLog("netServiceDidStop:")
  end
end
