class PickerController < UIViewController
  def viewDidAppear(animated)
    session = GKSession.alloc.initWithSessionID("connect", displayName: nil, sessionMode: GKSessionModePeer)
    session.delegate = self
    session.available = true
    @picker = GKPeerPickerController.alloc.init
    @picker.delegate = self
    @picker.show
    alert("ZOMG")
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

  def alert(msg)
    dialog = UIAlertView.alloc.initWithTitle("GK", message: msg, delegate:nil, cancelButtonTitle: "OK", otherButtonTitles:nil)
    dialog.show
  end

  def didReceiveConnectionRequestFromPeer(peerID)
    alert("ZOMG")
  end
end
