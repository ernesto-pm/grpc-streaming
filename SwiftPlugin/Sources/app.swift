import ArgumentParser
import GRPC
import NIOCore
import NIOPosix


@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
@main
struct App: AsyncParsableCommand {
    
    @Option(help: "The port to listen to for this gRPC server")
    var port = 6000
    
    func run() async throws {
        let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
        defer {
            try! group.syncShutdownGracefully()
        }
        
        let server = try await Server.insecure(group: group)
            .withServiceProviders([PluginServiceProvider()])
            .bind(host: "localhost", port: self.port) // host might need to be changed to 0.0.0.0 in deployments to expose to the network interface
            .get()
        
        print("Server started on port: \(server.channel.localAddress!.port!)")
        
        try await server.onClose.get()
    }
}
