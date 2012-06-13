class PickerController < UIViewController
  def viewDidAppear(animated)
    @picker = GKPeerPickerController.alloc.init
    @picker.delegate = self
    @picker.show
  end

  # GKPeerPickerControllerDelegate

  def peerPickerController(picker, didSelectConnectionType: type)
    alert("connectToPeer")
  end

  def peerPickerController(picker, sessionForConnectionType: type)
    alert("sessionForConnectionType")
    session = GKSession.alloc.initWithSessionID("connect", displayName: nil, sessionMode: GKSessionModePeer)
    session.delegate = self
    session.available = true
    session
  end

  def peerPickerController(picker, didConnectPeer: peer_id, toSession: session)
    alert("didConnectPeer")
    picker.dismiss
  end

  def peerPickerControllerDidCancel(picker)
    alert("cancel")
  end

  # GKSessionDelegate
  def session(session, peer: peer, didChangeState: state)
    alert("state: #{state}")
    case state
    when GKPeerStateAvailable
      alert("available")
    when GKPeerStateUnavailable
    when GKPeerStateConnected
      alert(session.displayNameForPeer(peer))
    when GKPeerStateDisconnected
    when GKPeerStateConnecting
      alert("connecting")
    end
  end

  def session(session, didReceiveConnectionRequestFromPeer: peer_id)
    alert("didReceiveConnectionRequestFromPeer")
  end

  def session(session, connectionWithPeerFailed:peerId, withError: error)
    alert("didReceiveConnectionRequestFromPeer")
  end

  def connectionWithPeerFailed(peer_id, withError: error)
    alert("didReceiveConnectionRequestFromPeer")
  end

  def session(session, didFailWithError: error)
    alert("didFailWithError")
  end

  protected

  def alert(msg)
    # dialog = UIAlertView.alloc.initWithTitle("GK", message: msg, delegate:nil, cancelButtonTitle: "OK", otherButtonTitles:nil)
    # dialog.show
    NSLog(msg)
  end
end
