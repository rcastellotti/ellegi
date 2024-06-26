// Generated by the gRPC C++ plugin.
// If you make any local change, they will be lost.
// source: livegrep.proto

#include "livegrep.pb.h"
#include "livegrep.grpc.pb.h"

#include <functional>
#include <grpcpp/support/async_stream.h>
#include <grpcpp/support/async_unary_call.h>
#include <grpcpp/impl/channel_interface.h>
#include <grpcpp/impl/client_unary_call.h>
#include <grpcpp/support/client_callback.h>
#include <grpcpp/support/message_allocator.h>
#include <grpcpp/support/method_handler.h>
#include <grpcpp/impl/rpc_service_method.h>
#include <grpcpp/support/server_callback.h>
#include <grpcpp/impl/server_callback_handlers.h>
#include <grpcpp/server_context.h>
#include <grpcpp/impl/service_type.h>
#include <grpcpp/support/sync_stream.h>

static const char* CodeSearch_method_names[] = {
  "/CodeSearch/Info",
  "/CodeSearch/Search",
  "/CodeSearch/Reload",
};

std::unique_ptr< CodeSearch::Stub> CodeSearch::NewStub(const std::shared_ptr< ::grpc::ChannelInterface>& channel, const ::grpc::StubOptions& options) {
  (void)options;
  std::unique_ptr< CodeSearch::Stub> stub(new CodeSearch::Stub(channel, options));
  return stub;
}

CodeSearch::Stub::Stub(const std::shared_ptr< ::grpc::ChannelInterface>& channel, const ::grpc::StubOptions& options)
  : channel_(channel), rpcmethod_Info_(CodeSearch_method_names[0], options.suffix_for_stats(),::grpc::internal::RpcMethod::NORMAL_RPC, channel)
  , rpcmethod_Search_(CodeSearch_method_names[1], options.suffix_for_stats(),::grpc::internal::RpcMethod::NORMAL_RPC, channel)
  , rpcmethod_Reload_(CodeSearch_method_names[2], options.suffix_for_stats(),::grpc::internal::RpcMethod::NORMAL_RPC, channel)
  {}

::grpc::Status CodeSearch::Stub::Info(::grpc::ClientContext* context, const ::InfoRequest& request, ::ServerInfo* response) {
  return ::grpc::internal::BlockingUnaryCall< ::InfoRequest, ::ServerInfo, ::grpc::protobuf::MessageLite, ::grpc::protobuf::MessageLite>(channel_.get(), rpcmethod_Info_, context, request, response);
}

void CodeSearch::Stub::async::Info(::grpc::ClientContext* context, const ::InfoRequest* request, ::ServerInfo* response, std::function<void(::grpc::Status)> f) {
  ::grpc::internal::CallbackUnaryCall< ::InfoRequest, ::ServerInfo, ::grpc::protobuf::MessageLite, ::grpc::protobuf::MessageLite>(stub_->channel_.get(), stub_->rpcmethod_Info_, context, request, response, std::move(f));
}

void CodeSearch::Stub::async::Info(::grpc::ClientContext* context, const ::InfoRequest* request, ::ServerInfo* response, ::grpc::ClientUnaryReactor* reactor) {
  ::grpc::internal::ClientCallbackUnaryFactory::Create< ::grpc::protobuf::MessageLite, ::grpc::protobuf::MessageLite>(stub_->channel_.get(), stub_->rpcmethod_Info_, context, request, response, reactor);
}

::grpc::ClientAsyncResponseReader< ::ServerInfo>* CodeSearch::Stub::PrepareAsyncInfoRaw(::grpc::ClientContext* context, const ::InfoRequest& request, ::grpc::CompletionQueue* cq) {
  return ::grpc::internal::ClientAsyncResponseReaderHelper::Create< ::ServerInfo, ::InfoRequest, ::grpc::protobuf::MessageLite, ::grpc::protobuf::MessageLite>(channel_.get(), cq, rpcmethod_Info_, context, request);
}

::grpc::ClientAsyncResponseReader< ::ServerInfo>* CodeSearch::Stub::AsyncInfoRaw(::grpc::ClientContext* context, const ::InfoRequest& request, ::grpc::CompletionQueue* cq) {
  auto* result =
    this->PrepareAsyncInfoRaw(context, request, cq);
  result->StartCall();
  return result;
}

::grpc::Status CodeSearch::Stub::Search(::grpc::ClientContext* context, const ::Query& request, ::CodeSearchResult* response) {
  return ::grpc::internal::BlockingUnaryCall< ::Query, ::CodeSearchResult, ::grpc::protobuf::MessageLite, ::grpc::protobuf::MessageLite>(channel_.get(), rpcmethod_Search_, context, request, response);
}

void CodeSearch::Stub::async::Search(::grpc::ClientContext* context, const ::Query* request, ::CodeSearchResult* response, std::function<void(::grpc::Status)> f) {
  ::grpc::internal::CallbackUnaryCall< ::Query, ::CodeSearchResult, ::grpc::protobuf::MessageLite, ::grpc::protobuf::MessageLite>(stub_->channel_.get(), stub_->rpcmethod_Search_, context, request, response, std::move(f));
}

void CodeSearch::Stub::async::Search(::grpc::ClientContext* context, const ::Query* request, ::CodeSearchResult* response, ::grpc::ClientUnaryReactor* reactor) {
  ::grpc::internal::ClientCallbackUnaryFactory::Create< ::grpc::protobuf::MessageLite, ::grpc::protobuf::MessageLite>(stub_->channel_.get(), stub_->rpcmethod_Search_, context, request, response, reactor);
}

::grpc::ClientAsyncResponseReader< ::CodeSearchResult>* CodeSearch::Stub::PrepareAsyncSearchRaw(::grpc::ClientContext* context, const ::Query& request, ::grpc::CompletionQueue* cq) {
  return ::grpc::internal::ClientAsyncResponseReaderHelper::Create< ::CodeSearchResult, ::Query, ::grpc::protobuf::MessageLite, ::grpc::protobuf::MessageLite>(channel_.get(), cq, rpcmethod_Search_, context, request);
}

::grpc::ClientAsyncResponseReader< ::CodeSearchResult>* CodeSearch::Stub::AsyncSearchRaw(::grpc::ClientContext* context, const ::Query& request, ::grpc::CompletionQueue* cq) {
  auto* result =
    this->PrepareAsyncSearchRaw(context, request, cq);
  result->StartCall();
  return result;
}

::grpc::Status CodeSearch::Stub::Reload(::grpc::ClientContext* context, const ::Empty& request, ::Empty* response) {
  return ::grpc::internal::BlockingUnaryCall< ::Empty, ::Empty, ::grpc::protobuf::MessageLite, ::grpc::protobuf::MessageLite>(channel_.get(), rpcmethod_Reload_, context, request, response);
}

void CodeSearch::Stub::async::Reload(::grpc::ClientContext* context, const ::Empty* request, ::Empty* response, std::function<void(::grpc::Status)> f) {
  ::grpc::internal::CallbackUnaryCall< ::Empty, ::Empty, ::grpc::protobuf::MessageLite, ::grpc::protobuf::MessageLite>(stub_->channel_.get(), stub_->rpcmethod_Reload_, context, request, response, std::move(f));
}

void CodeSearch::Stub::async::Reload(::grpc::ClientContext* context, const ::Empty* request, ::Empty* response, ::grpc::ClientUnaryReactor* reactor) {
  ::grpc::internal::ClientCallbackUnaryFactory::Create< ::grpc::protobuf::MessageLite, ::grpc::protobuf::MessageLite>(stub_->channel_.get(), stub_->rpcmethod_Reload_, context, request, response, reactor);
}

::grpc::ClientAsyncResponseReader< ::Empty>* CodeSearch::Stub::PrepareAsyncReloadRaw(::grpc::ClientContext* context, const ::Empty& request, ::grpc::CompletionQueue* cq) {
  return ::grpc::internal::ClientAsyncResponseReaderHelper::Create< ::Empty, ::Empty, ::grpc::protobuf::MessageLite, ::grpc::protobuf::MessageLite>(channel_.get(), cq, rpcmethod_Reload_, context, request);
}

::grpc::ClientAsyncResponseReader< ::Empty>* CodeSearch::Stub::AsyncReloadRaw(::grpc::ClientContext* context, const ::Empty& request, ::grpc::CompletionQueue* cq) {
  auto* result =
    this->PrepareAsyncReloadRaw(context, request, cq);
  result->StartCall();
  return result;
}

CodeSearch::Service::Service() {
  AddMethod(new ::grpc::internal::RpcServiceMethod(
      CodeSearch_method_names[0],
      ::grpc::internal::RpcMethod::NORMAL_RPC,
      new ::grpc::internal::RpcMethodHandler< CodeSearch::Service, ::InfoRequest, ::ServerInfo, ::grpc::protobuf::MessageLite, ::grpc::protobuf::MessageLite>(
          [](CodeSearch::Service* service,
             ::grpc::ServerContext* ctx,
             const ::InfoRequest* req,
             ::ServerInfo* resp) {
               return service->Info(ctx, req, resp);
             }, this)));
  AddMethod(new ::grpc::internal::RpcServiceMethod(
      CodeSearch_method_names[1],
      ::grpc::internal::RpcMethod::NORMAL_RPC,
      new ::grpc::internal::RpcMethodHandler< CodeSearch::Service, ::Query, ::CodeSearchResult, ::grpc::protobuf::MessageLite, ::grpc::protobuf::MessageLite>(
          [](CodeSearch::Service* service,
             ::grpc::ServerContext* ctx,
             const ::Query* req,
             ::CodeSearchResult* resp) {
               return service->Search(ctx, req, resp);
             }, this)));
  AddMethod(new ::grpc::internal::RpcServiceMethod(
      CodeSearch_method_names[2],
      ::grpc::internal::RpcMethod::NORMAL_RPC,
      new ::grpc::internal::RpcMethodHandler< CodeSearch::Service, ::Empty, ::Empty, ::grpc::protobuf::MessageLite, ::grpc::protobuf::MessageLite>(
          [](CodeSearch::Service* service,
             ::grpc::ServerContext* ctx,
             const ::Empty* req,
             ::Empty* resp) {
               return service->Reload(ctx, req, resp);
             }, this)));
}

CodeSearch::Service::~Service() {
}

::grpc::Status CodeSearch::Service::Info(::grpc::ServerContext* context, const ::InfoRequest* request, ::ServerInfo* response) {
  (void) context;
  (void) request;
  (void) response;
  return ::grpc::Status(::grpc::StatusCode::UNIMPLEMENTED, "");
}

::grpc::Status CodeSearch::Service::Search(::grpc::ServerContext* context, const ::Query* request, ::CodeSearchResult* response) {
  (void) context;
  (void) request;
  (void) response;
  return ::grpc::Status(::grpc::StatusCode::UNIMPLEMENTED, "");
}

::grpc::Status CodeSearch::Service::Reload(::grpc::ServerContext* context, const ::Empty* request, ::Empty* response) {
  (void) context;
  (void) request;
  (void) response;
  return ::grpc::Status(::grpc::StatusCode::UNIMPLEMENTED, "");
}


