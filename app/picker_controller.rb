class PickerController < UIViewController
  def viewDidAppear(animated)
    @picker = GKPeerPickerController.alloc.init
    @picker.delegate = self
    @session = GKSession.alloc.initWithSessionID("connect", displayName: nil, sessionMode: GKSessionModePeer)
    @session.delegate = self
    @session.available = true
    @picker.show
  end

  # GKPeerPickerController


  def didSelectConnectionType(type)
  end

  # GKPeerPickerControllerDelegate
  # didSelectConnectionType:
  # sessionForConnectionType:

  # GKSesssion
  # connectToPeer:withTimeout:
  # cancelConnectToPeer:
  # acceptConnectionFromPeer:error:
  # denyConnectionFromPeer:

  # def peerPickerControllerDidCancel(picker)
  #   picker.delegate = nil
  # end

  # GKSessionDelegate
  # didChangeState:
  # didReceiveConnectionRequestFromPeer:
  # connectionWithPeerFailed:withError:
  # didFailWithError:
end
