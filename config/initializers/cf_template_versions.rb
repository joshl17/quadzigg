require "#{Rails.root}/app/workers/cf_template_versions_creator_worker"
if ENV['ASSET_PRECOMPILE'].to_i == 0
  CfTemplateVersionsCreatorWorker.perform_async()
end
