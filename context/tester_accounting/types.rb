module TesterAccounting
  module Types
    include Dry.Types()

    ReportId = Integer.optional
    AccountScope = Integer.optional
    CatToyId = Integer.optional
    CatToyOptions = String.constrained(min_size: 10)
    CatToyTitle = String.constrained(min_size: 3)
    ReportComment = String.constrained(min_size: 10)
    ReportDoneStatus = Types.Value("done").default("done".freeze)
    ReportInProgressStatus = Types.Value("in_progress").default("in_progress".freeze)
    ReportStatuses = (ReportDoneStatus | ReportInProgressStatus).default("in_progress".freeze)
  end
end
