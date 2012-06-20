class SearchController < UIViewController
  attr_accessor :services

  def viewDidLoad
    viewRect = UIScreen.mainScreen.applicationFrame
    @table = UITableView.alloc.initWithFrame(viewRect, style: UITableViewStylePlain)
    @table.delegate = self
    @table.dataSource = self
    @table.reloadData

    self.view.addSubview(@table)
  end

  def viewWillAppear(animated)
    self.services = []
    @browser = NSNetServiceBrowser.alloc.init
    @browser.delegate = self
    @browser.searchForServicesOfType("_discovery._tcp.", inDomain:"")

    super animated
  end

  def viewWillDisappear(animated)
    super animated
    @browser.stop
    @browser.delegate = nil
    @browser = nil
  end

  # NSNetServiceBrowserDelegate

  def netServiceBrowser(browser, didFindService:service, moreComing:more)
    NSLog("Found service #{service}")
    self.services ||= []
    self.services.addObject service

    @table.reloadData
  end

  def netServiceBrowser(browser, didRemoveService:service, moreComing:more)
    NSLog("Remove service #{service}")
	  self.services.removeObject(service)
  end

  def netServiceBrowser(browser, didFindDomain:domain, moreComing:more)
    NSLog("Found domain #{domain}")
  end

  def netServiceBrowser(browser, didRemoveDomain:domain, moreComing:more)
    NSLog("Remove domain #{domain}")
  end

  def netServiceBrowserWillSearch(browser)
    NSLog("Will search")
  end

  def netServiceBrowser(browser, didNotSearch:error)
  end

  def netServiceBrowserDidStopSearch(browser)
    NSLog("Stop searching.")
	  self.services.removeAllObjects
  end

  # UITableView
  # -(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  #-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

  def tableView(table, cellForRowAtIndexPath:index)
    NSLog("cellForRowAtIndexPath #{index.row}")
    cellID = "service"
    if cell = table.dequeueReusableCellWithIdentifier(cellID)
    else
      cell = UITableViewCell.alloc.initWithFrame(CGRectZero, reuseIdentifier:cellID).autorelease
    end
    text = self.services[index.row].name
    NSLog("table row #{text}")
    cell.textLabel.text = text
    cell
  end

  def tableView(table, numberOfRowsInSection: section)
    self.services ? self.services.size : 0
  end
end
