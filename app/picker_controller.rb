class PickerController < UIViewController
  def viewDidAppear(animated)
    @picker = GKPeerPickerController.alloc.init
    @picker.delegate = self
    @session = GKSession.alloc.initWithSessionID(nil, displayName: "hello#{rand(100)}", sessionMode: GKSessionModePeer)
    @session.delegate = self
    @session.available = true
    NSLog(@session.displayName)
    @picker.show
  end

  def peerPickerControllerDidCancel(picker)
    picker.delegate = nil
  end
end
