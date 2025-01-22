import UIKit
import WebKit

public protocol SessionDelegate: AnyObject {
    func session(_ session: Session, didProposeVisit proposal: VisitProposal)
    func session(_ session: Session, didFailRequestForVisitable visitable: Visitable, error: Error)
    
    func session(_ session: Session, openExternalURL url: URL)
    func session(_ session: Session, didReceiveAuthenticationChallenge challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void)

    func sessionDidLoadWebView(_ session: Session)
    func sessionDidStartRequest(_ session: Session)
    func sessionDidFinishRequest(_ session: Session)
    func sessionDidStartFormSubmission(_ session: Session)
    func sessionDidFinishFormSubmission(_ session: Session)

    func sessionWebViewProcessDidTerminate(_ session: Session)
    func session(_ session: Session, webNavigationDecisionFor navigationAction: WKNavigationAction) -> WebNavigationDecision
}

public extension SessionDelegate {
    func sessionDidLoadWebView(_ session: Session) {
        session.webView.navigationDelegate = session
    }
    
    func session(_ session: Session, openExternalURL url: URL) {
        UIApplication.shared.open(url)
    }
    
    func sessionDidStartRequest(_ session: Session) {}
    func sessionDidFinishRequest(_ session: Session) {}
    func sessionDidStartFormSubmission(_ session: Session) {}
    func sessionDidFinishFormSubmission(_ session: Session) {}
    
    func session(_ session: Session, didReceiveAuthenticationChallenge challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        completionHandler(.performDefaultHandling, nil)
    }
}
